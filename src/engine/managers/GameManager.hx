package engine.managers;

import game.*;
import engine.*;
import engine.managers.*;
import hxd.*;

class GameManager extends Manager {
    
    public static var instance (get, null) : GameManager = null;
    public static function get_instance() {
        if (instance == null){
            instance = new GameManager();
        }
        return instance;
	}
	
	public var entities(default, null): List<Entity>;

    private override function new() {
        super();
    }

    public override function init() {
		super.init();
		DataManager.instance.init();
		TimeManager.instance.init();
		PhysicManager.instance.init();

		entities = new List<Entity>();
		var player = new Player(Main.currentScene); 

		var alien = new Alien(Main.currentScene);
		entities.add(player);
		entities.add(alien);
	}
	
    public override function update() {
		super.update();
		TimeManager.instance.update();
		PhysicManager.instance.update();

		for(e in entities){
			e.update();
		}
        Log.addLog("Laser Instancied : " + entities.filter(function (e:Entity){return Type.getClass(e) == Laser;}).length, 0xFF0000, "laserInstencied");
        Log.addLog("Laser Activated : " + entities.filter(function (e:Entity){return Type.getClass(e) == Laser && e.isActivate;}).length, 0xFF0000, "laserActivated");
	}
}