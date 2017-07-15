package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxObject;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.util.FlxSave;

class PlayState extends FlxState
{
	public var personaje : Personaje;
	public var enemigo : Enemigo;
	public var cantenemigos: Int = 50;
	public var barra : HealthBar;
	public var scrtxt: FlxText;
	override public function create():Void
	{
		super.create();
		
		FlxG.worldBounds.set( 0, 0, 8000, 1000);
		var bg : FlxBackdrop = new FlxBackdrop(AssetPaths.fondo__png , 1, 0, true, false);
		var fg : FlxBackdrop = new FlxBackdrop(AssetPaths.piso__png, 1, 0, true, false);
		fg.setPosition(0, 347);
		bg.setPosition(0, 25);
		add(fg);
		add(bg);
		
		personaje = new Personaje(FlxG.worldBounds.width/2 - 32, 370);
		FlxG.camera.scroll.add(FlxG.worldBounds.width/2 - 32 - FlxG.width/2 , 0);
		var _x : Int;
		for (i in 0...cantenemigos){
			do{
			_x = Std.random(Std.int(FlxG.worldBounds.width));
			}while (_x > FlxG.worldBounds.width/2 -500 && _x < FlxG.worldBounds.width/2 +500);
			enemigo = new Enemigo(_x, 370 + personaje.height - 64, personaje);
			enemigo.id = i;
			personaje.enemigos.add(enemigo);
		}
		
		
		barra = new HealthBar(personaje, "vida");
		
		scrtxt = new Score(0, 50, 0, "VOTOS 00000", 16,true,personaje);
		
		
		/*
		if(FlxG.save.data.highscore >= 0){
		FlxG.save.data.highscore += 50;
		}else{
			FlxG.save.data.highscore = 0;
		}
		trace(FlxG.save.data.highscore);
		FlxG.save.flush();
		
		
		*/
		FlxG.debugger.visible = true;
		
		
		personaje.x += 1;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
	}
	
	
}
