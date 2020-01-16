package engine;
import h2d.Object;

class Entity extends h2d.Drawable {
    
    var drawable : h2d.Drawable;
    var velocity : h2d.col.Point;

    public function new(_parent:h2d.Object, _spriteSheet:h2d.Tile, ?_nbSprite:Int = 0, ?_animSpeed:Float = 15) {
        super(_parent);
        if (_nbSprite > 0) {

            var anims:Array<h2d.Tile> = [];
            for(i in 0..._nbSprite) {

                anims.insert(i, _spriteSheet.sub(
                    i * _spriteSheet.width / _nbSprite, 0, 
                    _spriteSheet.width / _nbSprite, _spriteSheet.height));
            }
            drawable = new h2d.Anim(anims, _animSpeed, _parent);
        }
        else {
            drawable = new h2d.Bitmap(_spriteSheet, _parent);
        }
        drawable.setPosition(100, 100);
    }

    public function init() {
        
    }

    public function update() {
    }
}