package;

import hxd.System;
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
	private var player : game.Player;
	private var entities = new List<engine.Entity>();
    
	static function main() {
		new Game();
	}
	
	override function init() {
		Res.initEmbed();
		player = new game.Player(s2d, Res.spaceship.toTile(), 2, 15);
		var alien = new game.Alien(s2d, Res.alien.toTile(), 4, 10);
		entities.add(player);
		entities.add(alien);
	}
	
	override function update(dt:Float) {
		
		if (hxd.Key.isDown(hxd.Key.ESCAPE)) {
			dispose();
		}
		for(e in entities){
			e.update();
		}
	}
}