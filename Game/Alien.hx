package game;
import h2d.Object;

/**
 * TODO: Spawner
 * TODO: AI
 */
class Alien extends game.Ship{
    public function new(_parent:h2d.Object, _animDatas:engine.AnimationDatas, _laserAnimDatas:engine.AnimationDatas) {
        super(_parent, _animDatas, _laserAnimDatas); 
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 2;
    }
}