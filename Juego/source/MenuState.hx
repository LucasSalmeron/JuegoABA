package;

import flash.net.URLRequest;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import openfl.Lib;
/**
 * ...
 * @author ...
 */
class MenuState extends FlxState 
{

	override public function create():Void 
	{
		super.create();
		var btn : FlxButton = new FlxButton(0, 0, "Jugar", jugar);
		btn.loadGraphic(AssetPaths.btn__png, true, 80, 20);
		add(btn);
		var btn2 : FlxButton = new FlxButton(0,50, "Links", links);
		btn.loadGraphic(AssetPaths.btn__png, true, 80, 20);
		add(btn2);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	public function links(){
		
		trace("liiinks");
	/*	var http : Http = new Http("Ahorabuenosaires.info");
		http.onError("error");
		http.onData("kul");
		http.request();
	    
		trace(http.responseData); */
		
		Lib.getURL(new URLRequest("https://ahorabuenosaires.info/propuestas/"));
		
	}
	public function jugar(){
		
		trace("hai");
		FlxG.switchState(new PlayState());
	}
}