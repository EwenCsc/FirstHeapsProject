package engine.managers;

import engine.*;
import engine.managers.*;
import hxd.*;

class TimeManager extends Manager {
    
    public static var instance (get, null) : TimeManager = null;
    public static function get_instance() {
        if (instance == null){
            instance = new TimeManager();
        }
        return instance;
    }
    
    public var deltaTime(get, null) : Float;

    private override function new() {
        super();
    }

    public override function init() {
        super.init();
        Log.addLog("fps : " + cast(Timer.fps(), Int), 0xFF0000, "fps");
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