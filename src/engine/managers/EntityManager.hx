package engine.managers;

import hl.uv.Tcp;
import haxe.macro.Compiler.NullSafetyMode;
import game.*;
import engine.*;
import engine.Entity;
import engine.managers.*;
import hxd.*;
import haxe.Constraints;
import haxe.*;

class EntityManager extends Manager {
    
    public static var instance (get, null) : EntityManager = null;
    public static function get_instance() {
        if (instance == null){
            instance = new EntityManager();
        }
        return instance;
    }

    private var entities : List<Entity>;
    public var player(default, null) : Player;

    private override function new() {
        super();
    }
    
    public override function init() {
        super.init();
        
		entities = new List<Entity>();
		player = new Player(Main.currentScene); 
		entities.add(player);
    }

    public override function update() {
        super.update();
		for(e in entities){
			e.update();
		}
        engine.Log.addLog("Laser Instancied : " + entities.filter(function (e:Entity){return Type.getClass(e) == Laser;}).length, 0xFF0000, "laserInstencied");
        engine.Log.addLog("Laser Activated : " + entities.filter(function (e:Entity){return Type.getClass(e) == Laser && e.isActivate;}).length, 0xFF0000, "laserActivated");
    }

    public function getFirstEntityOfType(cl:Class<Entity>, isActivated = true) : Null<Entity> {
        return entities.getFirst(function (e:Entity) {
            return Type.getClass(e) == cl && e.isActivate == isActivated;
        });
    }

    public function getEntitiesOfType(cl:Class<Entity>, isActivated = true) : Null<List<Entity>> {
        return entities.filter(function (e:Entity) {
            return Type.getClass(e) == cl && e.isActivate == isActivated;
        });
    }

    public function add(e : Entity) {
        entities.add(e);
    }
}