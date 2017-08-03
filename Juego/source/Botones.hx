package;

import flixel.FlxSprite;
import flixel.ui.FlxSpriteButton;

/**
 * ...
 * @author ...
 */
class Botones extends FlxSpriteButton 
{

	var _x : Float;
	
	var personaje : Personaje;
	public function new(X:Float=0, Y:Float=0, flecha : Bool, izq : Bool, p : Personaje ) 
	{
		super(X, Y);
		if (flecha){
			loadGraphic("assets/flecha.png", false);
			updateHitbox();
			alpha = 0.6;
		}else{
			loadGraphic("assets/btnatacar.png", false);
			updateHitbox();
		}
		
		if (izq){
			this.flipX = true;
		}
		
		_x = p.x;
		personaje = p;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}