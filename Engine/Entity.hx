package engine;
import h2d.Object;

/** extends drawable to draw automaticly on the scene 
 *  TODO: Adding bounds if not already exists
 *  TODO: Shooting lasers
 *  TODO: Stats like life, speed, power etc etc
 */
class Entity extends h2d.Drawable {
    
    private var drawable : h2d.Drawable;
    private var velocity : h2d.col.Point;
    private var moveSpeed : Float;

    public function new(_parent:h2d.Object, _spriteSheet:h2d.Tile, ?_nbSprite:Int = 0, ?_animSpeed:Float = 15) {
        super(_parent);

        /** Parsing To set drawable as Anim or just Bitmap */
        if (_nbSprite > 0) {

            var anims:Array<h2d.Tile> = [];
            var spriteWidth = _spriteSheet.width / _nbSprite;
            var spriteHeight = _spriteSheet.height; 
            for(i in 0..._nbSprite) {
                var sprite = _spriteSheet.sub(
                    i * spriteWidth, 0, 
                    spriteWidth, spriteHeight);
                // Center the tile's pivot
                sprite.setCenterRatio();
                anims.insert(i, sprite);
            }

            /** creating the drawable
             * parent = this to have this as parent ... 
             * !...Well done Ewen you're a genius
             **/ 
            drawable = new h2d.Anim(anims, _animSpeed, this);
        }
        else {
            var btm = new h2d.Bitmap(_spriteSheet, this);
            btm.tile.setCenterRatio();
            drawable = btm;
        }
    }

    public function init() {
        
    }

    public function update() {
    }
}