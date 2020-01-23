package engine.managers;

import engine.*;
import engine.managers.*;
import hxd.*;

class TimeManager extends Manager {
    
    public var deltaTime(get, null) : Float;

    public override function new() {
        super();
    }

    public override function init() {
        super.init();
        Log.addLog("fps : " + Timer.fps(), 0xFF0000, "fps");
    }

    public override function update() {
        super.update();
        Timer.update();
        Log.addLog("fps : " + cast(Timer.fps(), Int), 0xFF0000, "fps");
    }

    public function get_deltaTime() {
        return Timer.dt;
    }
}