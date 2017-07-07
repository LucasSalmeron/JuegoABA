package;

import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class HealthBar extends FlxBar 
{
	var personaje : Personaje;
	var _x : Float;

	public function new(parentRef:Dynamic, variable:String="") 
	{
	super(50, 50, FlxBarFillDirection.LEFT_TO_RIGHT, 300, 30, parentRef, variable, 0, 5, true);
	personaje = parentRef;
	_x = personaje.x;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
	super.update(elapsed);
	if (_x != personaje.x){
		_x = personaje.x;
		this.x = personaje.x - FlxG.width / 2 + 50;
	}
	}
	
	
	
}