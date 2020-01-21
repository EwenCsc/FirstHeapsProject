package engine;

import h2d.*;
import hxd.*;
import h2d.Object;

/** extends drawable to draw automaticly on the scene 
 *  TODO: Adding bounds if not already exists
 */
class Entity extends h2d.Drawable {
    
    private var drawable : h2d.Drawable;
    private var velocity : h2d.col.Point;
    
    public var localPosition(get, set) : h2d.col.Point;

    public var globalPosition(get, null) : h2d.col.Point;

    public function new(_parent:h2d.Object, _animDatas:engine.AnimationDatas) {
        // try {
        //     cast(_parent, h2d.Scene);
        //     throw "Attention le parent de l'entité n'est pas une Scene";
        // }
        // try {
        //     cast(_parent, h2d.Drawable);
        //     throw "Attention le parent de l'entité n'est pas un Drawble, il ne va pas s'afficher ...";
        // }
        super(_parent);

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
    }

    public function init() {
        
    }

    public function update() {
    }

    override function getScene() : Scene {
        return Game.currentScene;
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
}