package game;
import hxd.*;
import h2d.Object;

class Laser extends engine.Entity {

    public var toDestroy : Bool;

    public function new(_parent:h2d.Object, origin:h2d.col.Point, _animDatas:engine.AnimationDatas) {
        super(_parent, _animDatas);
        x = origin.x;
        y = origin.y;
    }

    override function update() {
        super.update();
        y -= 5;
        rotation += 1;
        if (y < 100) {
            toDestroy = true;
        }
    }
}
