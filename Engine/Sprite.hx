package myEngine;

import myEngine.*;

class Sprite extends engine.Component {

    private var spriteSheet : h2d.Tile;
    private var customGraphics : h2d.Graphics;

    public function new(_s2d:h2d.Scene, _spriteSheet:h2d.Tile) {
        super();
        customGraphics = new h2d.Graphics(_s2d);
        spriteSheet = _spriteSheet;
    }

    public override function Draw() {

        //specify a color we want to draw with
        customGraphics.beginTileFill(spriteSheet);
        //Draw a rectangle at 10,10 that is 300 pixels wide and 200 pixels tall
        customGraphics.drawRect(0, 0, spriteSheet.width, spriteSheet.height);
        //End our fill
        customGraphics.endFill();
    }
}