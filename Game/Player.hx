package game;
import h2d.Object;

class Player extends engine.Entity{

    public function new(_parent:h2d.Object, _spriteSheet:h2d.Tile, ?_nbSprite:Int = 0, ?_animSpeed:Float = 15) {
        super(_parent, _spriteSheet, _nbSprite, _animSpeed);
    }

    override function update() {
        velocity = new h2d.col.Point(0, 0);

        if (hxd.Key.isDown(hxd.Key.LEFT)) {
            velocity.x -= 5;
        }
        if (hxd.Key.isDown(hxd.Key.RIGHT)) {
            velocity.x += 5;
        }
        if (hxd.Key.isDown(hxd.Key.UP)) {
            velocity.y -= 5;
        }
        if (hxd.Key.isDown(hxd.Key.DOWN)) {
            velocity.y += 5;
        }
        var str = "Player Position : (" + Std.string(drawable.x) + ", " + Std.string(drawable.y) + ");";
        engine.Log.addLog(str, 0xFF0000, "playerPos", parent);
        drawable.move(velocity.x, velocity.y);
    }
}