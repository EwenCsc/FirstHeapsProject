package game;

import engine.*;

/** Player and Aliens
 *  TODO: Shooting lasers
 *  TODO: Stats like life, speed, power etc etc
 */
class Ship extends engine.Entity {

    private var laserAnimationData : engine.AnimationDatas;
    private var lasers = new List<Laser>();
    private var life : Float;
    private var moveSpeed : Float;

    private var shootingCooldown : Float;
    private var currentShootingTimer : Float;

    public function new(_parent:h2d.Object, _animDatas:engine.AnimationDatas, _laserAnimDatas:engine.AnimationDatas) {
        super(_parent, _animDatas);
        laserAnimationData = _laserAnimDatas;
        currentShootingTimer = 0;
    }

    public override function update() {
        super.update();
        for (l in lasers) {
            l.update();
            if(l.toDestroy) {
                lasers.remove(l);
                removeChild(l); 
                l.remove(); 
            }
        }
    }

    private function shoot() {
        if (currentShootingTimer == 0) {
            lasers.add(new Laser(getScene(), localPosition, laserAnimationData));
        }
    }

    public function receiveDamage(_damage:Float) {
        
    }
}