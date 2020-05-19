package;

import flixel.text.FlxText;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.player.Hero;
import entities.obstacle.Projectile;
import entities.terrain.Floor;
import flixel.FlxState;


class PlayState extends FlxState
{		
	private static var FLOOR_COUNT(default, never) = 20;
	private static var FLOOR_START_X(default, never) = 0;
	private static var FLOOR_START_Y(default, never) = 300;

	private static var PROJECTILE_COUNT(default, never) = 10;
	private static var PROJECTILE_SPAWN_BORDER_Y(default, never) = 300;

	private var hero:Hero;
	private var projectiles:FlxTypedGroup<Projectile>;
	private var floors:FlxTypedGroup<Floor>;
	
	private var projectileExists = false;

	// CREATE FUNCTION
	override public function create():Void
	{
			
		super.create();
	
		hero = new Hero();
		hero.x= 0;
		hero.y= 200;
		add(hero);
	
		initializeFloor();
		// initializeProjectile();
	}
	
	
	// INITIALIZEFLOOR FUNCTION
	private function initializeFloor()
	{
		floors = new FlxTypedGroup<Floor>();
		for (i in 0...FLOOR_COUNT) 
		{
			var x:Float = FLOOR_START_X + (i * Floor.WIDTH);
			var y:Float = FLOOR_START_Y;
			var floor:Floor = new Floor(x, y);
			floors.add(floor);
		}
		add(floors);
	}

	// INITIALIZEPROJECTILE FUNCTION
	private function initializeProjectile()
	{
		projectiles = new FlxTypedGroup<Projectile>();
		for (i in 0...PROJECTILE_COUNT) 
		{
			var x:Float = 500;
			var y:Float = FlxG.random.int(PROJECTILE_SPAWN_BORDER_Y, FlxG.height-PROJECTILE_SPAWN_BORDER_Y);
			var projectile = new Projectile(x,y);
			projectiles.add(projectile);
		}
		add(projectiles);
	}
	

	// UPDATE FUNCTION
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
		// Colllides hero into wall
		FlxG.collide(hero, floors);

		FlxG.overlap(hero, projectiles, resolveHeroObstacleOverlap);

		for (projectile in projectiles) 
			{
				screenWrapObject(projectile);
			}

	
	}


	// SCREENWRAPOBJECT FUNCTION
	private function screenWrapObject(wrappingObject:FlxObject) 
	{
		if (wrappingObject.x > FlxG.width) {
			wrappingObject.x = 0 - wrappingObject.width;
		} else if (wrappingObject.x + wrappingObject.width < 0) {
			wrappingObject.x = FlxG.width;
		}

		if (wrappingObject.y > FlxG.height) {
			wrappingObject.y = 0 - wrappingObject.height;
		} else if (wrappingObject.y + wrappingObject.height < 0) {
			wrappingObject.y = FlxG.height;
		}
	}
	
	// RESOLVEHEROOBSTACLEOVERLAP FUNCTION
	private function resolveHeroObstacleOverlap(hero:Hero, projectile:Projectile) 
	{
		trace("You went splat!");
		projectile.kill();
		hero.kill();
	}
	
}
