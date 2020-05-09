package;

import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.player.Hero;
import entities.obstacle.Projectile;
import entities.terrain.Wall;
import entities.terrain.Floor;
import flixel.FlxState;


class PlayState extends FlxState
{		
	private static var WALL_COUNT(default, never) = 10;
	private static var WALL_START_X(default, never) = 150;
	private static var WALL_START_Y(default, never) = 200;

	private static var FLOOR_COUNT(default, never) = 20;
	private static var FLOOR_START_X(default, never) = 0;
	private static var FLOOR_START_Y(default, never) = 300;

	private var hero:Hero;
	private var projectile:Projectile;
	private var walls:FlxTypedGroup<Wall>;
	private var floors:FlxTypedGroup<Floor>;
	
	private var projectileExists = false;

	override public function create():Void
	{
			
		super.create();
	
		hero = new Hero();
		hero.x= 0;
		hero.y= 200;
		add(hero);
	
		initializeFloor();
		// initializeFireballs();
	}
	
	
	private function initializeFloor()
		{
			floors = new FlxTypedGroup<Floor>();
			for (i in 0...FLOOR_COUNT) {
				var x:Float = FLOOR_START_X + (i * Floor.WIDTH);
				var y:Float = FLOOR_START_Y;
				var floor:Floor = new Floor(x, y);
				floors.add(floor);
			}
			add(floors);
		}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		// Uncomment to collide hero against all wall objects.
		FlxG.collide(hero, projectile);
		FlxG.collide(hero, floors);


		resolveHeroObstacleOverlap(hero, projectile);

		if (projectile.x > 0)
			{
				projectile.kill();
			}
	
	}
	

		private function initializeProjectile()
			{
				if (!projectileExists)
					{
						projectile = new Projectile();
						add(projectile);
					}
			}
		/**
			Function called when an overlap between hero and fireball is detected.
		**/
		private function resolveHeroObstacleOverlap(hero:Hero, projectile:Projectile) {
			trace("You went splat!");
			//projectile.kill();
			hero.kill();
		}
	

	
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
