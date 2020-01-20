package;
import h2d.*;
import hxd.App;
import hxd.Res;

class Game extends hxd.App {
	private var entities = new List<engine.Entity>();
    public static var currentScene : h2d.Scene;
    
	static function main() {
		new Game();
	}
	
	override function init() {
		Res.initEmbed();
		currentScene = s2d;
		var player = new game.Player(
			s2d, 
			new engine.AnimationDatas(Res.spaceship.toTile(), 2, 15), 
			new engine.AnimationDatas(Res.laser_spaceship.toTile(), 6, 15));

		var alien = new game.Alien(s2d, 
			new engine.AnimationDatas(Res.alien.toTile(), 4, 10),
			new engine.AnimationDatas(Res.alien.toTile(), 4, 10));
		entities.add(player);
		entities.add(alien);
	}
	
	override function update(dt:Float) {
		for(e in entities){
			e.update();
		}
	}
}