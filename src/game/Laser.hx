package game;

import format.swf.Data.FontKerningData;
import hxd.snd.openal.ReverbDriver;
import game.*;
import engine.*;
import engine.managers.*;
import hxd.*;
import h2d.Object;

class Laser extends Entity {

    // public var toDestroy (default, null) : Bool;
    public var owner (default, set) : Object;
    public function set_owner(obj:Object) : Object {
        owner = obj;
        return owner;
    }

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
            // toDestroy = true;
            isActivate = false;
        }
    }

    override function onCollisionEnter(ent : Entity) : Bool {
        if (super.onCollisionEnter(ent)) {
            if(Type.getClass(ent) == Alien) {
                setColliderColor(new h3d.Vector(1, 0, 0, 1).toColor());
            }
            return true;
        }
        return false;
    }

    override function onCollisionStay(ent : Entity) : Bool {
        if (super.onCollisionStay(ent)) {
            if(Type.getClass(ent) == Alien) {
                setColliderColor(new h3d.Vector(1, 0, 1, 1).toColor());
            }
            return true;
        }
        return false;
    }

    override function onCollisionExit(ent : Entity)  : Bool {
        if (super.onCollisionExit(ent)){
            if(Type.getClass(ent) == Alien) {
                setColliderColor(new h3d.Vector(0, 1, 0, 1).toColor());
            }
            return true;
        }
        return false;
    }
}
