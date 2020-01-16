package game;

/** Player and Aliens
 *  TODO: Shooting lasers
 *  TODO: Stats like life, speed, power etc etc
 */
class Ship extends engine.Entity {

    private var laserAnimationData : engine.AnimationDatas;
    private var lasers = new List<Laser>();
    private var life : Float;
    private var moveSpeed : Float;

    public function new(_parent:h2d.Object, _animDatas:engine.AnimationDatas, _laserAnimDatas:engine.AnimationDatas) {
        super(_parent, _animDatas);
        laserAnimationData = _laserAnimDatas;
    }

    public override function update() {
        super.update();
        for (l in lasers) {
            l.update();
            if(l.toDestroy) {
                lasers.remove(l);
                removeChild(l);
            }
        }
    }

    private function shoot() {
        lasers.add(new Laser(this, laserAnimationData));
    }

    public function receiveDamage(_damage:Float) {
        
    }
}