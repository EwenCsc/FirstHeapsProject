package engine.managers;

import engine.managers.*;

enum ManagersType {
    None;
    GameManager;
    DataManager;
    TimeManager;
}

class Toolbox {
    
    var managers : Map<ManagersType, Manager>;
    var unremovables : List<ManagersType>;
    
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
        managers = new Map<ManagersType, Manager>();
        unremovables = new List<ManagersType>();

        addManager(ManagersType.DataManager, true);
        addManager(ManagersType.GameManager, true);
        addManager(ManagersType.TimeManager, true);
    }

    public function update() {
        for (manager in managers) {
            manager.update();
        }
    }

    public function addManager(_type:ManagersType, ?_unremovable:Null<Bool> = false) {
        if (!managers.exists(_type)) {
            switch (_type) {
                case ManagersType.GameManager : managers.set(_type, new GameManager());
                case ManagersType.TimeManager : managers.set(_type, new TimeManager());
                case ManagersType.DataManager : managers.set(_type, new DataManager());
                case _: return;
            }
            managers.get(_type).init();
            
            if(_unremovable)
                unremovables.add(_type);
        }
    }
    
    public function removeManager(_type:ManagersType) {
        if (managers.exists(_type) && unremovables.filter(function (e) return e != _type).isEmpty()) {
            managers.remove(_type);
        }
        else if(unremovables.filter(function (e) return e != _type).isEmpty()) {
            trace("This manager cannot be removed!");
        }
    }

    // @:generic public function get<T:Manager>(_type:ManagersType, ?createNotExisting:Null<Bool> = true) : T {
    //     if (managers.exists(_type)) {
    //         return managers.get(_type);
    //     }
    //     else if (createNotExisting) {
    //         addManager<T>(false);
    //         return get<T>(false);
    //     }
    //     return null;
    // }
}