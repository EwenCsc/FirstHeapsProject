package myEngine;

import myEngine.*;

class Toolbox {
    
    var managers : Map<Type, Manager>;
    var unremovables : List<Type>;
    
    public static var instance (get, null) : Toolbox = null;
    public static function get_instance() {
        if (instance == null){
            instance = new Toolbox();
        }
        return instance;
    }

    private function new() {
        
    }

    public function init() {
        addManager<GameManager>(true);
        addManager<TimeManager>(true);
        addManager<DataManager>(true);
    }

    public function update() {
        for (manager in managers.keys()) {
            trace(manager.update());
          }
    }

    @:generic public function addManager<T>(unremovable:bool = false) {
        if (!managers.exists(T)) {
            managers.set(T, new T());
            manager.get(T).init();
            
            unremovables.add(T);
        }
    }
    
    @:generic public function removeManager<T>() {
        if (managers.exists(T) && unremovables.filter(function (e) return e.getClass<T>() != null)) {
            managers.remove(T);
        }
        else if(unremovables.filter(function (e) return e.getClass<T>() != null)) {
            trace("This manager cannot be removed!");
        }
    }

    @:generic public function get<T>(createNotExisting:bool = true) : T {
        if (managers.exists(T)) {
            return cast(managers.get(T), T);
        }
        else if (createNotExisting) {
            addManager<T>();
            return get<T>(false);
        }
        return null;
    }
}