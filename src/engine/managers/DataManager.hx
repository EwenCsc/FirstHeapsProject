package engine.managers;

import engine.*;
import engine.managers.*;
import h2d.*;
import hxd.App;
import hxd.Res;

class DataManager extends Manager{
    
    public static var instance (get, null) : DataManager = null;
    public static function get_instance() {
        if (instance == null){
            instance = new DataManager();
        }
        return instance;
    }

    private var animationDatas : Map<String, AnimationDatas> = new Map<String, AnimationDatas>();

    private override function new() {
       super(); 
    }

    public override function init() {
        super.init();

        animationDatas.set("SpaceShip", new AnimationDatas(Res.spaceship.toTile(), 2, 15)); 
        animationDatas.set("Laser_SpaceShip", new AnimationDatas(Res.laser_spaceship.toTile(), 6, 15));
        animationDatas.set("Alien", new AnimationDatas(Res.alien.toTile(), 4, 10));
        animationDatas.set("DamagedAlien", new AnimationDatas(Res.alien_damaged.toTile(), 4, 10));
    }

    public function get(_key:String) : AnimationDatas {
        if (animationDatas.exists(_key)) {
            return animationDatas[_key];
        }
        return null;
    }
}