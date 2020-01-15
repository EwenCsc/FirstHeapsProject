package engine;
import h2d.Object;

class Entity extends h2d.Drawable {
    
    var drawable : h2d.Drawable;
    var position : h2d.col.Point;

    public function new(_spriteSheet:h2d.Tile, _nbSprite:Int, _parent:h2d.Object) {
        super(_parent);
        position = new h2d.col.Point(100, 100);
        if (_nbSprite > 0) {

            var anims:Array<h2d.Tile> = [];
            for(i in 0..._nbSprite) {

                anims.insert(i, _spriteSheet.sub(
                    i * _spriteSheet.width / _nbSprite, 0, 
                    _spriteSheet.width / _nbSprite, _spriteSheet.height));
            }
            drawable = new h2d.Anim(anims, 15, _parent);
        }
        else {
            drawable = new h2d.Bitmap(_spriteSheet, _parent);
        }
        drawable.setPosition(position.x, position.y);
    }

    public function Init() {
        
    }

    public function Update() {
        
    }
}