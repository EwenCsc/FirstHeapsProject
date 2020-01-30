package engine;

import engine.*;

class AnimationDatas {
    public var spriteSheet:h2d.Tile;
    public var nbSprite:Int = 0;
    public var animSpeed:Float = 15;

    public function new(_spriteSheet:h2d.Tile, ?_nbSprite:Int = 0, ?_animSpeed:Float = 15) {
        spriteSheet = _spriteSheet;
        nbSprite = _nbSprite;
        animSpeed = _animSpeed;
    }
}