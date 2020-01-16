package game;
import h2d.Object;

 /**
  * TODO: Limiting pos to the screen
  */
class Player extends game.Ship{
     
    public function new(_parent:h2d.Object, _animDatas:engine.AnimationDatas, _laserAnimDatas:engine.AnimationDatas) {
        super(_parent, _animDatas, _laserAnimDatas);
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 1.2;
    }

    override function update() {
        movement();
        if (hxd.Key.isDown(hxd.Key.SPACE) && lasers.length < 1) {
            shoot();
        }
        super.update();
        engine.Log.addLog("Laser Instancied : " + lasers.length, 0xFF0000, "bulletsCount", parent);    
    }

    private function movement() {
        velocity = new h2d.col.Point(0, 0);

        if (hxd.Key.isDown(hxd.Key.LEFT)) {
            velocity.x -= 5;
        }
        if (hxd.Key.isDown(hxd.Key.RIGHT)) {
            velocity.x += 5;
        }
        x += velocity.x;
        
        engine.Log.addLog("Player Position : (" + Std.string(x) + ", " + Std.string(y) + ");", 0xFF0000, "playerPos", parent);
        
    }
}