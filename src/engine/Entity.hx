package engine;

import engine.engine_helpers.Color;
import haxe_helper.Delegate;
import h2d.col.Bounds;
import engine.*;
import h2d.*;
import hxd.*;
import h2d.Object;

/** extends drawable to draw automaticly on the scene 
 *  
 */
class Entity extends h2d.Drawable {
    
    public var isActivate (default, null) = true;

    private var collidingObjects : List<Entity>;
    private var collidingObjectsThisFrame : List<Entity>;

    private var velocity : h2d.col.Point;
    
    public var localPosition(get, set) : h2d.col.Point;
    public var globalPosition(get, null) : h2d.col.Point;

    private static var colliderDebug : Bool = true;
    private var colliderRectangle : Drawable = null;

    public var onCollisionEnterDelegate : Delegate;
    public var onCollisionStayDelegate : Delegate;
    public var onCollisionExitDelegate : Delegate;

    private var animations : Map<String, Anim>;
    private var currentAnimKey : String;

    public function new(_parent:h2d.Object, ?_animations : Map<String, AnimationDatas>, ?_animDatas:AnimationDatas) {
        if (_animDatas == null && _animations == null && Lambda.count(_animations) > 0) return;
        super(_parent);
        parent = _parent;

        initGraphics(_animations, _animDatas);
        init();

        // Debug Colliders
        setColliderColor(Color.Green);
    }

    private  function initGraphics(?_animations : Map<String, AnimationDatas>, ?_animDatas:AnimationDatas) {
        if (_animDatas == null && _animations == null) return;
        animations = new Map<String, Anim>();
        
        if (_animations != null){
            for (animK in _animations.keys()) {
                animations.set(animK, initGraphic(_animations[animK]));
                animations[animK].visible = false;
            }
        }
        else {
            animations.set("Idle", initGraphic(_animDatas));
        }
        currentAnimKey = animations.firstKey();
        animations[currentAnimKey].visible = true;
    }

    private function initGraphic (_animDatas:AnimationDatas) : Anim{
        /** Parsing To set drawable as Anim or just Bitmap */
        if (_animDatas.nbSprite > 0) {
            // Init sprites array
            var anims:Array<h2d.Tile> = [];
            // dimensions
            var spriteWidth = _animDatas.spriteSheet.width / _animDatas.nbSprite;
            var spriteHeight = _animDatas.spriteSheet.height; 
            // Split the spritesheet to fill anims with sprites
            for(i in 0..._animDatas.nbSprite) {
                var sprite = _animDatas.spriteSheet.sub(
                    i * spriteWidth, 0, 
                    spriteWidth, spriteHeight);
                // Center the sprite's pivot
                sprite.setCenterRatio();
                anims.insert(i, sprite);
            }

            /** creating the drawable
             * parent = this to have this as parent ... 
             * !...Well done Ewen you're a genius
             **/ 
            return new h2d.Anim(anims, _animDatas.animSpeed, this);
        }
        // No Anim so just get spriteSheet as a simple sprite
        else {
            var btm = new h2d.Bitmap(_animDatas.spriteSheet, this);
            var anims:Array<h2d.Tile> = [];
            _animDatas.spriteSheet.setCenterRatio();
            anims.push(_animDatas.spriteSheet);
            return new h2d.Anim(anims, 0, this);
        }
    }

    public function init() {
        collidingObjects = new List<Entity>();
        collidingObjectsThisFrame = new List<Entity>();
        onCollisionEnterDelegate = new Delegate();
        onCollisionStayDelegate = new Delegate();
        onCollisionExitDelegate = new Delegate();
    }

    public function update() : Bool {
        if (!isActivate) return false;
        collidingObjectsThisFrame.clear();
        return true;
    }

    public function onCollisionEnter(_obj : Entity) : Bool {
        if (_obj != this && collidingObjects.getFirst(function (e:Entity){ return e == _obj; }) == null){

            collidingObjects.add(_obj);
            collidingObjectsThisFrame.add(_obj);

            onCollisionEnterDelegate.invoke();
            return true;
        }
        return false;
    }

    public function onCollisionStay(_obj : Entity) : Bool {
        if (_obj != this && collidingObjects.getFirst(function (e:Entity){ return e == _obj; }) != null){

            collidingObjectsThisFrame.add(_obj);

            onCollisionStayDelegate.invoke();
            return true;
        }
        return false;
    }

    public function onCollisionExit(_obj : Entity) : Bool {
        if (_obj != this && 
            collidingObjects.getFirst(function (e:Entity){ return e == _obj; }) != null &&
            collidingObjectsThisFrame.getFirst(function (e:Entity){ return e == _obj; }) == null){

            collidingObjects.remove(_obj);
            onCollisionExitDelegate.invoke();
            return true;
        }
        return false;
    }

    var btmtmp : Bitmap;
    public function setColliderColor(_color : Int) {
        if (colliderDebug) {
            var thickness = 1;
            var w = cast(getBounds().getSize().x, Int);
            var h = cast(getBounds().getSize().y, Int);
            
            var bmpd = new hxd.BitmapData(w, h);
            bmpd.fill(0, 0,             w, thickness, _color); // Up
            bmpd.fill(0, h - thickness, w, thickness, _color); // Down
            bmpd.fill(0, 0,             thickness, h, _color); // Left
            bmpd.fill(w - thickness, 0, thickness, h, _color); // Right

            var btmtmp : Bitmap = new Bitmap(Tile.fromBitmap(bmpd), this);
            btmtmp.tile.setCenterRatio();
            colliderRectangle = btmtmp;
            bmpd.dispose();
        }
    }

    public override function getScene() : Scene {
        return Main.currentScene;
    }

    public function get_localPosition() {
        return new h2d.col.Point(x, y);
    }

    public function set_localPosition(_p:h2d.col.Point) {
        x += _p.x;
        y += _p.y;
        return new h2d.col.Point(x, y);
    }
    
    public function get_globalPosition() {
        trace(localPosition);
        return localToGlobal(localPosition);
    }

    public function intersects(ent : Entity):Bool {
        return getBounds().intersects(ent.getBounds());
    }

    private function resetValues() {
        isActivate = true;
    }
    
    public function deactivate () {
        visible = false;
        collidingObjects.clear();
        collidingObjectsThisFrame.clear();
        isActivate = false;
    }

    public function activate() {
        visible = true;
        resetValues();
    }

    private function setAnim(_key : String) {
        if (!animations.exists(_key) || currentAnimKey == _key) return;

        animations[currentAnimKey].visible = false;
        animations[_key].visible = true;
        currentAnimKey = _key;
    }
}