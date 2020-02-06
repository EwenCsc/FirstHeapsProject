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

    public function new(_parent:h2d.Object, _animDatas:AnimationDatas, _laserAnimDatas:AnimationDatas) {
        super(_parent, _animDatas);
        life = 10;
        laserAnimationData = _laserAnimDatas;
        shootingCooldown = 0.1;
        currentShootingTimer = 0;
    }

    public override function update() {

        super.update();
        currentShootingTimer -= TimeManager.instance.deltaTime;
        if (currentShootingTimer <= 0) 
            currentShootingTimer = 0;
        if (life <= 0)
            deactivate();
    }

    private function shoot() {
        if (currentShootingTimer == 0 &&
                cast(GameManager.instance.entities.filter(
                function (e:Entity){return Type.getClass(e) == Laser && e.isActivate;}).length < 100)) {

            currentShootingTimer = shootingCooldown;
            var l = cast(GameManager.instance.entities.getFirst(
                function (e:Entity){return Type.getClass(e) == Laser && !e.isActivate;}), Laser);
            if (l == null){
                l = new Laser(getScene(), localPosition, laserAnimationData, this);
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

    public function receiveDamage(_damage:Float) {
        
    }

    override function onCollisionEnter(ent : Entity) : Bool {
        if (super.onCollisionEnter(ent)) {
            if(Type.getClass(ent) == Alien) {
                life--;
            }
            return true;
        }
        return false;
    }
}