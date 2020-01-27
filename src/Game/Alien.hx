package game;

import game.*;
import engine.*;
import engine.managers.*;
import h2d.Object;

/**
 * TODO: Spawner
 * TODO: "AI"
 */
class Alien extends Ship{
    public function new(_parent:h2d.Object/*, _animDatas:AnimationDatas, _laserAnimDatas:AnimationDatas*/) {
        super(_parent, DataManager.instance.get("Alien"), DataManager.instance.get("Laser_SpaceShip"));
        x = cast(_parent, h2d.Scene).width / 2;
        y = cast(_parent, h2d.Scene).height / 2;
    }
}