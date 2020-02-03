package engine;

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
    
    private var collidingObjects : List<Entity>;
    private var collidingObjectsThisFrame : List<Entity>;

    private var drawable : h2d.Drawable;
    private var velocity : h2d.col.Point;
    
    public var localPosition(get, set) : h2d.col.Point;
    public var globalPosition(get, null) : h2d.col.Point;

    private static var colliderDebug : Bool = true;
    private var colliderRectangle : Drawable;

    public var onCollisionEnterDelegate : Delegate;
    public var onCollisionStayDelegate : Delegate;
    public var onCollisionExitDelegate : Delegate;

    public function new(_parent:h2d.Object, _animDatas:AnimationDatas) {
        // try {
        //     cast(_parent, h2d.Scene);
        //     throw "Attention le parent de l'entité n'est pas une Scene";
        // }
        // try {
        //     cast(_parent, h2d.Drawable);
        //     throw "Attention le parent de l'entité n'est pas un Drawble, il ne va pas s'afficher ...";
        // }
        super(_parent);
        parent = _parent;

        initGraphic(_animDatas);

        init();
    }

    private function initGraphic (_animDatas:AnimationDatas) {

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
            drawable = new h2d.Anim(anims, _animDatas.animSpeed, this);
        }
        // No Anim so just get spriteSheet as a simple sprite
        else {
            var btm = new h2d.Bitmap(_animDatas.spriteSheet, this);
            btm.tile.setCenterRatio();
            drawable = btm;
        }
        
        // Debug Colliders
        setColliderColor(new h3d.Vector(0, 1, 0, 1).toColor());
    }

    public function init() {
        collidingObjects = new List<Entity>();
        collidingObjectsThisFrame = new List<Entity>();
        onCollisionEnterDelegate = new Delegate();
        onCollisionStayDelegate = new Delegate();
        onCollisionExitDelegate = new Delegate();
    }

    public function update() {
        
    }

    public function onCollisionEnter(_obj : Entity) : Bool {
        if (_obj != this && collidingObjects.filter(function (e:Entity){ return e == _obj; }).first() == null){
            collidingObjects.add(_obj);
            collidingObjectsThisFrame.add(_obj);

            onCollisionEnterDelegate.invoke();
            return true;
        }
        return false;
    }

    public function onCollisionStay(_obj : Entity) : Bool {
        if (_obj != this && collidingObjects.filter(function (e:Entity){ return e == _obj; }).first() != null){
            collidingObjectsThisFrame.add(_obj);

            onCollisionStayDelegate.invoke();
            return true;
        }
        return false;
    }

    public function onCollisionExit(_obj : Entity) : Bool {
        if (_obj != this && 
            collidingObjects.filter(function (e:Entity){ return e == _obj; }).first() != null &&
            collidingObjectsThisFrame.filter(function (e:Entity){ return e == _obj; }).first() == null){

            collidingObjects.remove(_obj);
            onCollisionExitDelegate.invoke();

            collidingObjectsThisFrame.clear();
            return true;
        }
        return false;
    }

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

            var btm = new Bitmap(Tile.fromBitmap(bmpd), this);
            btm.tile.setCenterRatio();
            colliderRectangle = btm;
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
}