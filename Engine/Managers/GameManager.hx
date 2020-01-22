

class GameManager extends Manager {
	private var entities : List<Entity>;

    public function new() {
        
    }

    override public function init() {
		var player = new Player(s2d, 
			new AnimationDatas(Res.spaceship.toTile(), 2, 15), 
			new AnimationDatas(Res.laser_spaceship.toTile(), 6, 15));

		var alien = new Alien(s2d, 
			new AnimationDatas(Res.alien.toTile(), 4, 10),
			new AnimationDatas(Res.alien.toTile(), 4, 10));
		entities.add(player);
		entities.add(alien);
    }
    override function update() {
		for(e in entities){
			e.update();
		}
	}
}