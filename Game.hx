package;

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
	var text : Text;
	// var font : Font;
    
	static function main() {
		new Game();
	}
	
	override function init() {
		// Get les Assets du dossier res.
		Res.initEmbed();

		// Charge la resource
		// var font = FontBuilder.getFont("Pixellari.ttf", 128);
		// Creation d'un text
		text = new Text(DefaultFont.get(), s2d);
		text.text = "Hello World";
		text.textColor = 0xFF0000;

		//////////////////////////////
		
		var spriteSheet = Res.LinkSprites.toTile();
		var bitmap = new Bitmap(spriteSheet, s2d);
		// Set le pivot de l'image
		bitmap.tile.dx = -Math.round(bitmap.tile.width / 2);
		bitmap.tile.dy = -Math.round(bitmap.tile.height / 2);
		// Set la position, s2d étant les données du canvas.
		bitmap.x = s2d.width / 2;
		bitmap.y = s2d.height / 2;
	}
	
	override function update(dt:Float) {
		// var scaleAmount = 0.01;
		// if (text.scaleX < 3.0) 
		// {
		// 	text.setScale(text.scaleX + scaleAmount);
		// }
		// else 
		// {
		// 	text.setScale(0.1);
		// }
	}
}