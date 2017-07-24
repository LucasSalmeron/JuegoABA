package;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;
/**
 * ...
 * @author ...
 */
class Vidas 
{

	var corazon1 : FlxSprite;
	var corazon2 : FlxSprite;
	var corazon3 : FlxSprite;
	var corazon4: FlxSprite;
	var corazon5 : FlxSprite;
	
	var _x : Float;
	var p : Personaje;
	
	var v : Int = 5;
	
	var apuntado : FlxSprite;
	var timer : FlxTimer;
	public function new(_p: Personaje) 
	{		
		_x = _p.x;
		p = _p;
		
		
		corazon1 = new FlxSprite(0, 0);
		corazon1 .loadGraphic(AssetPaths.corazon__png, false, 337, 304);
		corazon1 .setGraphicSize(56, 50);
		corazon1 .updateHitbox();
		corazon1 .setPosition( FlxG.worldBounds.width/2 - FlxG.width / 2 + 50  , 40);
		FlxG.state.add(corazon1);
		
		corazon2 = new FlxSprite(0, 0);
		corazon2 .loadGraphic(AssetPaths.corazon__png, false, 337, 304);
		corazon2 .setGraphicSize(56, 50);
		corazon2 .updateHitbox();
		corazon2 .setPosition( corazon1.x+ corazon1.width + 5 , 40);
		FlxG.state.add(corazon2);
	
		corazon3 = new FlxSprite(0, 0);
		corazon3 .loadGraphic(AssetPaths.corazon__png, false, 337, 304);
		corazon3 .setGraphicSize(56, 50);
		corazon3 .updateHitbox();
		corazon3 .setPosition( corazon2.x + corazon2.width + 5 , 40);
		FlxG.state.add(corazon3);
		
		corazon4 = new FlxSprite(0, 0);
		corazon4 .loadGraphic(AssetPaths.corazon__png, false, 337, 304);
		corazon4 .setGraphicSize(56, 50);
		corazon4 .updateHitbox();
		corazon4 .setPosition( corazon3.x+ corazon3.width + 5 , 40);
		FlxG.state.add(corazon4);
		
		corazon5 = new FlxSprite(0, 0);
		corazon5 .loadGraphic(AssetPaths.corazon__png, false, 337, 304);
		corazon5 .setGraphicSize(56, 50);
		corazon5 .updateHitbox();
		corazon5 .setPosition( corazon4.x+ corazon4.width + 5 , 40);
		FlxG.state.add(corazon5);
		
		timer = new FlxTimer();
	}
	
	
	public function update(elapsed:Float):Void 
	{
	if (_x != p.x){
		
		
		var dif = p.x - _x;
		_x = p.x;

		
		corazon1.x = corazon1.x + dif;
	
		
		corazon2.x = corazon2.x+ dif;
		corazon3.x = corazon3.x + dif;
		corazon4.x = corazon4.x + dif;
		corazon5.x = corazon5.x + dif;
		
	}
	
	
	if (v != p.vida){
		v = p.vida;
		
		if (v != 4){
			apuntado.visible = false;
		}
			
		switch(v){
			case 1:
				apuntado = corazon2;
				timer.start(0.01, changealpha, 100);

			case 2:
				apuntado = corazon3;
				timer.start(0.01, changealpha, 100);

			case 3: 
				apuntado = corazon4;
				timer.start(0.01, changealpha, 100);

			case 4: 
				apuntado = corazon5;
				timer.start(0.02, changealpha, 50);
		}
		
	}
	

	}
	
	public function changealpha(tmr : FlxTimer){
		apuntado.alpha -= 0.02;
	}
	
	
	
	
}