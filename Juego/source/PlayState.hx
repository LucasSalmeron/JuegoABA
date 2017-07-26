package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxColor;
class PlayState extends FlxState
{
	public var personaje : Personaje;
	public var enemigo : Enemigo;
	public var cantenemigos: Int = 30;
	public var scrtxt: FlxText;
	
	public static var conte: Float = 0;
	
	public static var txtP : String = "";
	
	public var vidas : Vidas;
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
		FlxG.camera.scroll.add(FlxG.worldBounds.width / 2 - 32 - FlxG.width / 2 , 0);
		conte = 0;

		for (i in 0...cantenemigos){
		    personaje.crearEnemigo();
		}
		
		vidas  = new Vidas(personaje);
		
		scrtxt = new Score(0, 50, 0, "VOTOS 00000", 24, true, personaje);
		scrtxt.color = 0x491C51;
		FlxG.sound.music.stop();

		FlxG.sound.playMusic("assets/cancion.ogg",0.7);
		FlxG.sound.music.fadeIn(1, 0, 0.7);
	
		
		personaje.x += 1;
	}
	

	

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		vidas.update(elapsed);
	
	}
	
	
}
