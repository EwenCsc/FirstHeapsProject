package game;

import game.*;
import engine.*;
import h2d.Object;

/**
 * TODO: Spawner
 * TODO: AI
 */
class Alien extends Ship{
    public function new(_parent:h2d.Object, _animDatas:AnimationDatas, _laserAnimDatas:AnimationDatas) {
        super(_parent, _animDatas, _laserAnimDatas); 
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 2;
    }
}