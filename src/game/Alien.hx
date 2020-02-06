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

    public var movementFunction(null, default) : Float -> Void;

    public function new(_parent:h2d.Object) {
        var anims = new Map<String, AnimationDatas>();
        anims.set("Damaged", DataManager.instance.get("DamagedAlien"));
        anims.set("Idle", DataManager.instance.get("Alien"));
        super(_parent, anims);
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 2;

        movementFunction = sinusoid;
    }

    public function sinusoid(f:Float) {
        var timeToCross = 5.0;

        x = Math.lerp(0, getScene().width, f / timeToCross);
        y = (Math.sin(x / 50) * 70) + getScene().getSize().yMax / 2 ;

        if (x >= getScene().width + getBounds().width){
            deactivate();
        }
    }

    var timer = 0.0; 
    public override function update() : Bool {
        if (!super.update()) return false;

        timer += TimeManager.instance.deltaTime;
        movementFunction(timer);

        if (receiveDamage < receiveDamageCooldown) {
            setAnim("Damaged");
        }
        else {
            setAnim("Idle");
        }
        return true;
    }

    private override function resetValues(){
        super.resetValues();
        timer = 0;
        x = 100;
        y = 100;
    }
}