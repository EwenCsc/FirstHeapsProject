package engine.managers;

import engine.managers.GameManager;
import engine.managers.Manager;

class PhysicManager extends Manager {
    
    public static var instance (get, null) : PhysicManager = null;
    public static function get_instance() {
        if (instance == null){
            instance = new PhysicManager();
        }
        return instance;
    }

    private override function new() {
        super();
    }

    public override function init() {
        
    }

    public override function update() {
        for (e1 in GameManager.instance.entities) {
            for (e2 in GameManager.instance.entities) {
                if (e1 != e2) {
                    if (e1.intersects(e2)) {
                        e1.onCollisionStay(e2);
                        e2.onCollisionStay(e1);

                        e1.onCollisionEnter(e2);
                        e2.onCollisionEnter(e1);
                    }
                    else {
                        e1.onCollisionExit(e2);
                        e2.onCollisionExit(e1);
                    }
                }
            }
        }
    }
}