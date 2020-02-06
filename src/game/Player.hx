package game;

import format.hl.Data.AnyFunction;
import engine.managers.DataManager;
import game.*;
import engine.*;
import h2d.Object;
import h2d.col.*;

 /**
  * TODO: Limiting pos to the screen
  */
class Player extends game.Ship{
     
    public function new(_parent:h2d.Object) {
        // var anims = new Map<String, AnimationDatas>();
        // anims.set("Idle", DataManager.instance.get("SpaceShip"));
        super(_parent, DataManager.instance.get("SpaceShip"));
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 1.2;
    }

    override function update() : Bool {
        if (!super.update()) return false;
        movement();
        clampInBounds();
        shoot();
        log();
        return false;
    }

    override function shoot() {
        if (hxd.Key.isDown(hxd.Key.SPACE)) {
            super.shoot();
        }
    }

    private function log() {
        Log.addLog("Can Shoot : " + ((currentShootingTimer == 0) ? "True" : "False"), 0xFF0000, "shootCoolDown");        
    }

    private function movement() {
        velocity = new h2d.col.Point(0, 0);

        if (hxd.Key.isDown(hxd.Key.LEFT)  || hxd.Key.isDown(hxd.Key.Q)) {
            velocity.x -= 5;
        }
        if (hxd.Key.isDown(hxd.Key.RIGHT) || hxd.Key.isDown(hxd.Key.D)) {
            velocity.x += 5;
        }
        x += velocity.x;
        Log.addLog("Player Position : (" + Std.string(x) + ", " + Std.string(y) + ");", 0xFF0000, "playerPos"/*, getScene()*/);
        
    }

    private function clampInBounds() {
        if (x <= getBounds().width / 2)
            x = getBounds().width / 2;
        if (x >= getScene().width - getBounds().width / 2)
            x = getScene().width - getBounds().width / 2;
    }
}