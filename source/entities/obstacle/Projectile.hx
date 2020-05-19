package entities.obstacle;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Projectile extends FlxSprite {

    public static var WIDTH(default, never):Int = 10;
    public static var HEIGHT(default, never):Int = 10;

    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, FlxColor.RED);

        velocity.x = -50;
    }
}