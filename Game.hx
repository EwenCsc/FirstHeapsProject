package;

import engine.Sprite;
import h2d.SpriteBatch;
import hxd.res.DefaultFont;
import hxd.res.FontBuilder;
import hxd.fs.BytesFileSystem.BytesFileEntry;
import hxd.res.BitmapFont;
import haxe.Resource;
import h2d.Bitmap;
import h2d.Text;
import hxd.App;
import hxd.Res;
import hxd.res.Font;

class Game extends hxd.App {
	// private var player : game.Player;
	private var entities = new List<engine.Entity>();
    
	static function main() {
		new Game();
	}
	
	override function init() {
		Res.initEmbed();
		var player = new game.Player(Res.spaceship.toTile(), 2, s2d);
		var alien = new game.Alien(Res.alien.toTile(), 4, s2d);
		entities.add(player);
		entities.add(alien);
		// text = new Text(DefaultFont.get(), s2d);
		// text.text = "Hello World";
		// text.textColor = 0xFF0000;
	}
	
	override function update(dt:Float) {
		for(e in entities){
			e.Update();
		}
	}
}