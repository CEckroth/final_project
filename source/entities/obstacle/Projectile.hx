package entities.obstacle;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Projectile extends FlxSprite {
    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(20, 20, FlxColor.RED);

        velocity.x = -50;
    }
}