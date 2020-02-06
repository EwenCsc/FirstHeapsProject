package game;

import engine.engine_helpers.Color;
import game.*;
import engine.*;
import engine.managers.*;
import haxe_helper.*;


/** Player and Aliens
 *  TODO: Shooting lasers
 *  TODO: Stats like life, speed, power etc etc
 */
class Ship extends Entity {

    private var laserAnimationData : AnimationDatas;
    private var lasers = new List<Laser>();
    private var life : Float;
    private var moveSpeed : Float;

    private var shootingCooldown : Float;
    private var currentShootingTimer : Float;

    public var onCollide : Delegate;

    private var receiveDamageCooldown = 0.5;
    private var receiveDamage = 0.5;

    public function new(_parent:h2d.Object, ?_animations : Map<String, AnimationDatas>, ?_animDatas:AnimationDatas) {
        super(_parent, _animations, _animDatas);
        life = 10;
        shootingCooldown = 0.1;
        currentShootingTimer = 0;
    }

    public override function update() : Bool {
        receiveDamage += TimeManager.instance.deltaTime;
        if (!super.update()) return false;

        currentShootingTimer -= TimeManager.instance.deltaTime;
        if (currentShootingTimer <= 0) 
            currentShootingTimer = 0;
        if (life <= 0)
            deactivate();

        if (receiveDamage < receiveDamageCooldown) {
            setColliderColor(Color.Red);
        }
        else {
            setColliderColor(Color.Green);
        }
        return true;
    }

    private function shoot() {
        if (currentShootingTimer == 0 &&
                cast(GameManager.instance.entities.filter(
                function (e:Entity){return Type.getClass(e) == Laser && e.isActivate;}).length < 100)) {

            currentShootingTimer = shootingCooldown;
            var l = cast(GameManager.instance.entities.getFirst(
                function (e:Entity){return Type.getClass(e) == Laser && !e.isActivate;}), Laser);
            if (l == null){
                l = new Laser(getScene(), localPosition, DataManager.instance.get("Laser_SpaceShip"), this);
                // lasers.add(l);
                GameManager.instance.entities.add(l);
            }
            else {
                l.x = localPosition.x;
                l.y = localPosition.y;
                l.owner = this;
                l.activate();
                l.setColliderColor(Color.Green);
            }
        }
    }

    override function onCollisionEnter(ent : Entity) : Bool {
        if (super.onCollisionEnter(ent)) {
            if(Type.getClass(ent) == Laser) {
                var l = cast(ent, Laser);
                if(l.owner != this){
                    life--;
                    if (life <= 0){
                        setColliderColor(Color.White);
                    }
                    else{
                        receiveDamage = 0;
                    }
                }
            }
            return true;
        }
        return false;
    }
}