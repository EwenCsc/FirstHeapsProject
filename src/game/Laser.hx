package game;

import format.agal.Data;
import engine.engine_helpers.Color;
import format.swf.Data.FontKerningData;
import hxd.snd.openal.ReverbDriver;
import game.*;
import engine.*;
import engine.managers.*;
import hxd.*;
import h2d.Object;

class Laser extends Entity {

    public var owner (default, set) : Object;
    public function set_owner(obj:Object) : Object {
        owner = obj;
        return owner;
    }

    public function new(_parent:h2d.Object, origin:h2d.col.Point, ?_animations : Map<String, AnimationDatas>, ?_animDatas:AnimationDatas, _owner:Object) {
        super(_parent, _animations, _animDatas);
        x = origin.x;
        y = origin.y;
        owner = _owner;
    }

    override function update() : Bool {
        if (!super.update()) return false;
        y -= 5;

        // Destruction
        if (y < 100) {
            deactivate();
        }
        return true;
    }

    override function onCollisionEnter(ent : Entity) : Bool {
        if (super.onCollisionEnter(ent)) {
            if(Type.getClass(ent) == Alien) {
                setColliderColor(Color.Red);
                deactivate();
            }
            return true;
        }
        return false;
    }
}
