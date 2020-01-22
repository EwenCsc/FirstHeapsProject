package myEngine;

import myEngine.*;
import hxd.*;

class TimeManager extends Manager {
    
    public var deltaTime(get, null) : Float;

    public function new() {
        init();
    }

    public function init() {
        engine.Log.addLog("fps : " + Timer.fps(), 0xFF0000, "fps");
    }

    public function update() {
        Timer.update();
        engine.Log.addLog("fps : " + cast(Timer.fps(), Int), 0xFF0000, "fps");
    }

    public function get_deltaTime() {
        return Timer.dt;
    }
}