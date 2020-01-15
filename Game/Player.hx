package game;
import h2d.Object;

class Player extends engine.Entity{

    public function new(_spriteSheet:h2d.Tile, _nbSprite:Int, _parent:h2d.Object) {
        super(_spriteSheet, _nbSprite, _parent);
    }

    override function Update() {
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            trace("shoot!");
        }
    }
}