package entities.player;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Hero extends FlxSprite {
    public static var WIDTH(default, never):Int = 32;
    public static var HEIGHT(default, never):Int = 32;

    public static var GRAVITY(default, never):Float = 300;
    public static var TERMINAL_VELOCITY(default, never):Float = 600;
    public static var X_SPEED(default, never):Float = 200;

    public static var JUMP_SPEED(default, never):Float = -200;


    //Uncomment for testing, comment out when the map moves.
    private var leftInput:Bool = false;
    private var rightInput:Bool = false;
    
    private var jumpInput:Bool = false;

    public function new(?X:Float = 0, ?Y:Float = 0) {
        super(X, Y);
        makeGraphic(WIDTH, HEIGHT, FlxColor.WHITE);
        
        acceleration.y = GRAVITY;
        maxVelocity.y = TERMINAL_VELOCITY;
        
    }

    override function update(elapsed:Float) {

        gatherInputs();

        var direction:Int = getMoveDirectionCoefficient(leftInput,rightInput);
        velocity.x = X_SPEED * direction;

        jump(jumpInput);

        super.update(elapsed);

    }

    private function gatherInputs():Void {
        leftInput = FlxG.keys.pressed.A;
        rightInput = FlxG.keys.pressed.D;

        jumpInput = FlxG.keys.justPressed.SPACE;
    }

    /**
        Uses player input to determine if movement should occur in a positive or negative X 
        direction. If no movement inputs are detected, 0 is returned instead.
        @param leftPressed Boolean indicating if the "left" movement button is pressed.
        @param rightPressed Boolean indicating if the "right" movement button is pressed.
        @return Returns 1, 0, or -1. Multiply movement speed by this to set movement direction.
    **/
    private function getMoveDirectionCoefficient(leftPressed:Bool, rightPressed:Bool):Int {
        var finalDirection:Int = 0;        
        if (leftPressed) {
            finalDirection--;
        }
        if (rightPressed) {
            finalDirection++;
        }
        return finalDirection;
    }

    /**
        Simple function for handling jump logic.
        At the moment, this doesn't prevent the player from jumping while in the air.
        @param jumpJustPressed Boolean indicating if the jump button was pressed this frame.
    **/
    private function jump(jumpJustPressed:Bool):Void {
        if (jumpJustPressed) {
            velocity.y = JUMP_SPEED;
        }
    }
}

