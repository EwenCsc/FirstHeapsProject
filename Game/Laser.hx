package game;
import h2d.Object;

class Laser extends engine.Entity {

    public var toDestroy : Bool;
    public var originX : Float;

    public function new(_parent:h2d.Object, _animDatas:engine.AnimationDatas) {
        super(getScene(), _animDatas);
        trace(localPosition);
        x = globalPosition.x;
        y = globalPosition.y;
    }

    override function update() {
        y -= 0.5;
        rotation += 1;
        // if (y < 0) {
        //     toDestroy = true;
        // }
    }
}
