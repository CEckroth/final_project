package entities.terrain;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Floor extends FlxSprite {
    public static var WIDTH(default, never) = 32;
    public static var HEIGHT(default, never) = 32;
    
    //public static var X_SPEED(default, never):Float = -100;
    
    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, FlxColor.BLUE);
        

        // Set immovable to true, prevents this from getting pushed during FlxG.collide()
       immovable = true;
    }
    override function update(elapsed:Float) {

       // velocity.x = X_SPEED;
        super.update(elapsed);

    }
}