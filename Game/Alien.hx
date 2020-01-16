package game;
import h2d.Object;

class Alien extends engine.Entity{
    public function new(_parent:h2d.Object, _spriteSheet:h2d.Tile, ?_nbSprite:Int = 0, ?_animSpeed:Float = 15) {
        super(_parent, _spriteSheet, _nbSprite, _animSpeed); 
    }
}