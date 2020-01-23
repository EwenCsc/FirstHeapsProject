package;

import engine.*;
import engine.managers.*;
import h2d.*;
import hxd.App;
import hxd.Res;

class Main  extends hxd.App {
	public static var currentScene : Scene;
    
	static function main() {
		new Main();
	}
	
	override function init() {
		Res.initEmbed();
		currentScene = s2d;
		Toolbox.instance.init();
	}
	
	override function update(dt:Float) {
		Toolbox.instance.update();
	}
}
