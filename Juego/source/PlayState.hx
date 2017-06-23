package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxCamera.FlxCameraFollowStyle;

class PlayState extends FlxState
{
	public var personaje : Personaje;
	
	override public function create():Void
	{
		super.create();
		
		var bg : FlxBackdrop = new FlxBackdrop(AssetPaths.edificios__png, 1, 0, true, false);
		
		var fg : FlxBackdrop = new FlxBackdrop(AssetPaths.Piso__png, 1, 0, true, false);
		
		fg.setPosition(0, 347);
		bg.setPosition(0, 25);
		
		add(fg);
		add(bg);
		
		personaje = new Personaje(FlxG.width/2-32, 370);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//if (FlxG.keys.pressed.LEFT){ FlxG.camera.scroll.add( -5, 0); }
		//if (FlxG.keys.pressed.RIGHT){ FlxG.camera.scroll.add( 5 , 0); }
	}
	
	
}
