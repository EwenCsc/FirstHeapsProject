package game;

import game.*;
import engine.*;
import h2d.Object;
import h2d.col.*;

 /**
  * TODO: Limiting pos to the screen
  */
class Player extends game.Ship{
     
    public function new(_parent:h2d.Object, _animDatas:AnimationDatas, _laserAnimDatas:AnimationDatas) {
        super(_parent, _animDatas, _laserAnimDatas);
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 1.2;
    }

    override function update() {
        super.update();
        movement();
        if (hxd.Key.isDown(hxd.Key.SPACE)) {
            shoot();
        }
        Log.addLog("Laser Instancied : " + lasers.length, 0xFF0000, "bulletsCount"/*, getScene()*/);    
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
        
        Log.addLog("Player Position : (" + Std.string(x) + ", " + Std.string(y) + ");", 0xFF0000, "playerPos"/*, getScene()*/);
        
    }
}