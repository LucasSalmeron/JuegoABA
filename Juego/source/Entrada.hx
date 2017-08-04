package;
import flixel.FlxG;
import flixel.input.touch.FlxTouch;
/**
 * ...
 * @author ...
 */
class Entrada 
{
	
	
	
	
	public static function esMovil(){
		
		if (FlxG.html5.browserWidth < 800){
			trace("movil");
			return true;
		}else{
			trace("pc");
			return false;
		}

	}
	
	
	

	
	
	
	
	
	
	public static function irIzquierda(btn : Botones){
		
		if (esMovil()){
			return btn.pressed;
		}else{
			if (FlxG.keys.pressed.LEFT && !FlxG.keys.pressed.RIGHT){
				return true;
			}else{
				return false;
			}
		}
		
		
	}
	
	public static function irDerecha(btn : Botones){
		
		if (esMovil()){
			return btn.pressed;
		}else{
			if (!FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT){
				return true;
			}else{
				return false;
			}
		}
		
		
	}
	
	
	
	public static function atacar(btn : Botones){
		
		if (esMovil()){
			return btn.justPressed;
		}else{
			
			return FlxG.keys.justPressed.SPACE;
			
		}
		
		
	}
	
	
	public static function bothReleased(btn1 : Botones, btn2 : Botones){
		
		if (esMovil()){
		if (btn1.justReleased || btn2.justReleased){
				return true;
			}else{
				return false;
			}
		}else{
			if (FlxG.keys.justReleased.LEFT || FlxG.keys.justReleased.RIGHT){
				return true;
			}else{
				return false;
			}
		}
		
		
	}
	
	
		public static function oneJustPressed(btn1 : Botones, btn2 : Botones){
		
		if (esMovil()){
		if (btn1.justPressed || btn2.justPressed){
				return true;
			}else{
				return false;
			}
		}else{
			if (FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.RIGHT){
				return true;
			}else{
				return false;
			}
		}
		
		
	}
	
		public static function BothPressed(btn1 : Botones, btn2 : Botones){
		
		if (esMovil()){
		if (btn1.pressed && btn2.pressed){
				return true;
			}else{
				return false;
			}
		}else{
			if (	FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT){
				return true;
			}else{
				return false;
			}
		}
		
		
	}
	
	
	
	
	
	

	
	
	
	
}