package;

import hxd.App;
import hxd.Res;

class Game extends hxd.App {
	private var entities = new List<engine.Entity>();
    
	static function main() {
		new Game();
	}
	
	override function init() {
		Res.initEmbed();
		var player = new game.Player(s2d, Res.spaceship.toTile(), 2, 15);
		var alien = new game.Alien(s2d, Res.alien.toTile(), 4, 10);
		entities.add(player);
		entities.add(alien);
	}
	
	override function update(dt:Float) {
		for(e in entities){
			e.update();
		}
	}
}