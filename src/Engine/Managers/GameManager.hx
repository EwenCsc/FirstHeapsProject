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
	
	private var entities : List<Entity>;

    private override function new() {
        super();
    }

    public override function init() {
		super.init();
		DataManager.instance.init();
		TimeManager.instance.init();

		entities = new List<Entity>();
		var player = new Player(Main.currentScene); 

		var alien = new Alien(Main.currentScene);
		entities.add(player);
		entities.add(alien);
	}
	
    public override function update() {
		TimeManager.instance.update();
		super.update();
		for(e in entities){
			e.update();
		}
	}
}