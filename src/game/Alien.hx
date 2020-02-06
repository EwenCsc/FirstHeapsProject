package game;

import game.*;
import engine.*;
import engine.managers.*;
import h2d.Object;
import hxd.*;

/**
 * TODO: Spawner
 * TODO: "AI"
 */
class Alien extends Ship{

    var movementFunction : Float -> Void;

    public function new(_parent:h2d.Object) {
        var anims = new Map<String, AnimationDatas>();
        anims.set("Damaged", DataManager.instance.get("DamagedAlien"));
        anims.set("Idle", DataManager.instance.get("Alien"));
        super(_parent, anims);
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 2;

        movementFunction = sin;
    }

    public function sin(f:Float) {
        y = Math.sin(f);
        y = getScene().getSize().xMax / 2;
        x = Math.lerp(getScene().getSize().xMin, getScene().getSize().xMax, f);
    }

    var timer = 0.0;
    public override function update() : Bool {
        if (!super.update()) return false;
        Log.addLog("Alien life : " + life , 0xFF0000, "alienLife");

        timer += TimeManager.instance.deltaTime;
        movementFunction(timer / 600);

        if (receiveDamage < receiveDamageCooldown) {
            setAnim("Damaged");
        }
        else {
            setAnim("Idle");
        }
        return true;
    }
}