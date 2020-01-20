package game;
import h2d.Object;

class Laser extends engine.Entity {

    public var toDestroy : Bool;
    public var originX : Float;

    public function new(_parent:h2d.Object, origin:h2d.col.Point, _animDatas:engine.AnimationDatas) {
        super(getScene(), _animDatas);
        trace(origin);
        // x = origin.x;
        // y = origin.y;
        x = 100;
        y = 100;
    }

    override function update() {
        super.update();
        trace(y);
        engine.Log.addLog("Laser Position : (" + Std.string(x) + ", " + Std.string(y) + ");", 0xFF0000, "laserPos", getScene());
        y -= 5;
        rotation += 1;
        if (y < 0) {
            toDestroy = true;
        }
    }
}
