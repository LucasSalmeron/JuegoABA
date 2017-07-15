package;

import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Score extends FlxText 
{
    var personaje : Personaje;
	var _x : Float;
	var s: Int;
	var t: String;
	public function new(X:Float=0, Y:Float=0, FieldWidth:Float=0, ?Text:String, Size:Int=8, EmbeddedFont:Bool=true, p:Personaje) 
	{
		super(X, Y, FieldWidth, Text, Size, EmbeddedFont);
	    personaje = p;
     	_x = personaje.x;
		s = personaje.score;
		FlxG.state.add(this);
	}
	
	
	
	override public function update(elapsed:Float):Void 
	{
	super.update(elapsed);
	if (_x != personaje.x){
		_x = personaje.x;
		this.x = personaje.x + FlxG.width / 2 - 150;
	}
	
	if (personaje.score != s){
		
		s = personaje.score;
		t = "VOTOS ";
		if (s < 9){
		   t += "0000" + s;
	}else if (s < 99){
			t += "000" + s;
		}else if ( s < 999){
		t += "00" + s;	
		}else if ( s < 9999){
			t += "0" + s;
		}else{
			t +=  s;
		}
		
		text = t;
	}
	
	
	
	}
	
	

	
	
	
	
}