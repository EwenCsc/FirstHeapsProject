package game;

import hxd.snd.openal.ReverbDriver;
import game.*;
import engine.*;
import engine.managers.*;
import hxd.*;
import h2d.Object;

class Laser extends Entity {

    public var toDestroy (default, null) : Bool;
    public var owner (default, null) : Object;

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
        collisionWithShips();
    }

    private function collisionWithShips() {
        if(Type.getClass(owner) == Player){
            var getAliens = function(e:Entity) {
                return Type.getClass(e) == Alien;
            };
            var aliens = GameManager.instance.entities.filter(getAliens);
            if (aliens.length > 0) {
                for (a in aliens) {
                    if (a.getBounds().intersects(getBounds())) {
                        a.onCollisionEnterDelegate.invoke();
                        onCollisionEnterDelegate.invoke();
                    }
                }
            }
        }
        else if(Type.getClass(owner) == Alien){
            var getAliens = function(e:Entity) {
                return Type.getClass(e) == Player;
            };
            var player = GameManager.instance.entities.filter(getAliens).first();
            if (player != null) {
                if (player.getBounds().intersects(getBounds())) {
                    player.onCollisionEnterDelegate.invoke();
                    onCollisionEnterDelegate.invoke();
                }
            }
        }
    }
}
