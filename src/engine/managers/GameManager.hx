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

    private override function new() {
		super();
    }

	var spawner : AlienSpawner;
    public override function init() {
		super.init();
		DataManager.instance.init();

		TimeManager.instance.init();
		EntityManager.instance.init();
		PhysicManager.instance.init();	
		spawner = new AlienSpawner();
	}
	
    public override function update() {
		super.update();
		
		TimeManager.instance.update();
		EntityManager.instance.update();
		PhysicManager.instance.update();
		spawner.update();
	}
}