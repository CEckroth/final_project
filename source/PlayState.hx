package;

import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.player.Hero;
import entities.terrain.Wall;
import entities.terrain.Floor;
import flixel.FlxState;


class PlayState extends FlxState
{		
	private static var WALL_COUNT(default, never) = 10;
	private static var WALL_START_X(default, never) = 150;
	private static var WALL_START_Y(default, never) = 200;

	private static var FLOOR_COUNT(default, never) = 10;
	private static var FLOOR_START_X(default, never) = 10;
	private static var FLOOR_START_Y(default, never) = 200;

	private static var COIN_COUNT(default, never) = 5;
	private static var COIN_SPAWN_BORDER(default, never) = 50;

	private static var FIREBALL_COUNT(default, never) = 10;
	private static var FIREBALL_SPAWN_BORDER(default, never) = 50;

	private var hero:Hero;
	private var walls:FlxTypedGroup<Wall>;
	private var floors:FlxTypedGroup<Floor>;
	//private var coins:FlxTypedGroup<Coin>;
	//private var fireballs:FlxTypedGroup<Fireball>;

	override public function create():Void
	{
			
		super.create();
	
		hero = new Hero();
		hero.x= 240;
		hero.y= 170;
		add(hero);
	
		//initializeWalls();
		initializeFloor();
		// initializeFireballs();
		// initializeCoins();
	}
	
	private function initializeWalls() 
	{
		walls = new FlxTypedGroup<Wall>();
	
		for (i in 0...WALL_COUNT) {
			var x:Float = WALL_START_X + (i * Wall.WIDTH);
			var y:Float = WALL_START_Y;
			var wall:Wall = new Wall(x, y);
			walls.add(wall);
		}
		add(walls);

	}
	
	private function initializeFloor()
		{
			floors = new FlxTypedGroup<Floor>();
			for (i in 0...FLOOR_COUNT) {
				var x:Float = FLOOR_START_X + (i * Floor.WIDTH);
				var y:Float = WALL_START_Y;
				var floor:Floor = new Floor(x, y);
				floors.add(floor);
			}
		}

		// private function initializeFireballs() {
		// 	fireballs = new FlxTypedGroup<Fireball>();
	
		// 	for (i in 0...FIREBALL_COUNT) {
		// 		var x:Float = FlxG.random.int(FIREBALL_SPAWN_BORDER, 
		// 			FlxG.width - FIREBALL_SPAWN_BORDER);
		// 		var y:Float = FlxG.random.int(FIREBALL_SPAWN_BORDER, 
		// 			FlxG.height - FIREBALL_SPAWN_BORDER);
		// 		var fireball = new Fireball(x, y);
		// 		fireballs.add(fireball);
		// 	}
		// 	add(fireballs);
		// }
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		// Uncomment to collide hero against all wall objects.
		FlxG.collide(hero, walls);
		FlxG.collide(hero, floors);
	
		// // Wrap various objects if gone offscreen.
		screenWrapObject(hero);
		for (floor in floors) {
			screenWrapObject(floor);
		}
		// for (fireball in fireballs) {
		// 	screenWrapObject(fireball);
		// }
		// for (coin in coins) {
		// 	screenWrapObject(coin);
		// }
	
	}
	
	private function screenWrapObject(wrappingObject:FlxObject) 
	{
		if (wrappingObject.x > FlxG.width) 
		{
			wrappingObject.x = 0 - wrappingObject.width;
		} 
		else if (wrappingObject.x + wrappingObject.width < 0) 
		{
			wrappingObject.x = FlxG.width;
		}
	
		if (wrappingObject.y > FlxG.height) 
		{
			wrappingObject.y = 0 - wrappingObject.height;
		} 
		else if (wrappingObject.y + wrappingObject.height < 0) 
		{
			wrappingObject.y = FlxG.height;
		}
	}
	
		/**
			Function called when an overlap between hero and fireball is detected.
		**/
		//private function resolveHeroFireballOverlap(hero:Hero, fireball:Fireball) {
		// 	trace("Hero and Fireball collided!");
		// 	//fireball.kill();
		// 	hero.kill();
	
		// 	loseMessage = new FlxText(200, 200, 0, "You Died!", 50);
		// 	loseMessage.color.red;
		// 	loseMessage.setBorderStyle(SHADOW, FlxColor.CYAN);
		// 	add(loseMessage);
		// }
	
		// private function reseolveHeroCoinOverlap(hero:Hero, coin:Coin) {
		// 	trace("You got a Coin!");
		// 	coin.kill();
		// 	token++;
		// 	hud.updateHUD(token);
	
		// 	if (token == COIN_COUNT)
		// 		{
		// 			trace ("You collected all the coins!");
		// 			hero.kill();
		// 			winMessage = new FlxText(200, 200, 0, "You Win!", 50);
		// 			winMessage.color.yellow;
		// 			winMessage.setBorderStyle(SHADOW, FlxColor.RED);
		// 			add(winMessage);
		// 		}
		// }
}
