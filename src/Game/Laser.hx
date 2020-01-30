package game;

import game.*;
import engine.*;
import hxd.*;
import h2d.Object;

class Laser extends Entity {

    public var toDestroy (default, null): Bool;
    public var owner (default, null): Object;

    public function new(_parent:h2d.Object, origin:h2d.col.Point, _animDatas:AnimationDatas, _owner:Object) {
        super(_parent, _animDatas);
        x = origin.x;
        y = origin.y;
        owner = _owner;
    }

    override function update() {
        super.update();
        y -= 5;

        // Destruction
        if (y < 100) {
            toDestroy = true;
        }

        if(Type.typeof(owner) == Type.typeof(Alien)){
            
        }
    }
}
