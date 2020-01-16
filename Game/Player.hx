package game;
import h2d.Object;

 /**
  * TODO: Limiting pos to the screen
  */
class Player extends engine.Entity{

    public function new(_parent:h2d.Object, _spriteSheet:h2d.Tile, ?_nbSprite:Int = 0, ?_animSpeed:Float = 15) {
        super(_parent, _spriteSheet, _nbSprite, _animSpeed);
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 1.2;
    }

    override function update() {
        velocity = new h2d.col.Point(0, 0);

        if (hxd.Key.isDown(hxd.Key.LEFT)) {
            velocity.x -= 5;
        }
        if (hxd.Key.isDown(hxd.Key.RIGHT)) {
            velocity.x += 5;
        }
        x += velocity.x;
        // if (hxd.Key.isDown(hxd.Key.UP)) {
        //     velocity.y -= 5;
        // }
        // if (hxd.Key.isDown(hxd.Key.DOWN)) {
        //     velocity.y += 5;
        // }
        // y += velocity.y;
        engine.Log.addLog("Player Position : (" + Std.string(x) + ", " + Std.string(y) + ");", 0xFF0000, "playerPos", parent);
    }
}