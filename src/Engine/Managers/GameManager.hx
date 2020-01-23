package engine.managers;

import game.*;
import engine.*;
import engine.managers.*;
import hxd.*;

class GameManager extends Manager {
	
	private var entities : List<Entity>;

    public override function new() {
        super();
    }

    public override function init() {
		super.init();
		entities = new List<Entity>();
		var player = new Player(Main.currentScene, 
			new AnimationDatas(Res.spaceship.toTile(), 2, 15), 
			new AnimationDatas(Res.laser_spaceship.toTile(), 6, 15));

		var alien = new Alien(Main.currentScene, 
			new AnimationDatas(Res.alien.toTile(), 4, 10),
			new AnimationDatas(Res.alien.toTile(), 4, 10));
		entities.add(player);
		entities.add(alien);
	}
	
    public override function update() {
		super.update();
		for(e in entities){
			e.update();
		}
	}
}