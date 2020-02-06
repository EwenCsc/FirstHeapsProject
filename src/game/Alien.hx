package game;

import game.*;
import engine.*;
import engine.managers.*;
import h2d.Object;

/**
 * TODO: Spawner
 * TODO: "AI"
 */
class Alien extends Ship{
    public function new(_parent:h2d.Object) {
        var anims = new Map<String, AnimationDatas>();
        anims.set("Damaged", DataManager.instance.get("DamagedAlien"));
        anims.set("Idle", DataManager.instance.get("Alien"));
        super(_parent, anims);
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 2;
    }

    public override function update() : Bool {
        if (!super.update()) return false;
        Log.addLog("Alien life : " + life , 0xFF0000, "alienLife");

        if (receiveDamage < receiveDamageCooldown) {
            setAnim("Damaged");
        }
        else {
            setAnim("Idle");
        }
        return true;
    }
}