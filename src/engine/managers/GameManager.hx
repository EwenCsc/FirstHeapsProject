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
		trace ("Black : " + new h3d.Vector(0, 0, 0, 1).toColor());
		trace ("Red : " + new h3d.Vector(1, 0, 0, 1).toColor());
		trace ("Green : " + new h3d.Vector(0, 1, 0, 1).toColor());
		trace ("Blue : " + new h3d.Vector(0, 0, 1, 1).toColor());
		trace ("Yellow : " + new h3d.Vector(1, 1, 0, 1).toColor());
		trace ("Magenta : " + new h3d.Vector(1, 0, 1, 1).toColor());
		trace ("Cyan : " + new h3d.Vector(0, 1, 1, 1).toColor());
		trace ("White : " + new h3d.Vector(1, 1, 1, 1).toColor());
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