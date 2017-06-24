package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxObject;
import flixel.FlxCamera.FlxCameraFollowStyle;

class PlayState extends FlxState
{
	public var personaje : Personaje;
	public var enemigo : Enemigo;
	public var cantenemigos: Int = 50;
	override public function create():Void
	{
		super.create();
		
		FlxG.worldBounds.set( 0, 0, 8000, 1000);
		var bg : FlxBackdrop = new FlxBackdrop(AssetPaths.edificios__png, 1, 0, true, false);
		var fg : FlxBackdrop = new FlxBackdrop(AssetPaths.Piso__png, 1, 0, true, false);
		fg.setPosition(0, 347);
		bg.setPosition(0, 25);
		add(fg);
		add(bg);
		
		personaje = new Personaje(FlxG.worldBounds.width/2 - 32, 370);
		FlxG.camera.scroll.add(FlxG.worldBounds.width/2 - 32 - FlxG.width/2 , 0);
		var _x : Int;
		for (i in 0...cantenemigos){
			do{
			_x = Std.random(5000);
			}while (_x > FlxG.worldBounds.width/2 -500 && _x < FlxG.worldBounds.width/2 +500);
			enemigo = new Enemigo(_x, 370 + personaje.height - 64);
			personaje.enemigos.add(enemigo);
		}
		
		
		
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	
	}
	
	
}
