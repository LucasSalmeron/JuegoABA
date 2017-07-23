package;

import flash.net.URLRequest;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxTimer;
import openfl.Lib;
/**
 * ...
 * @author ...
 */
class MenuState extends FlxState 
{

	var btn : FlxButton ;
	var btn2 : FlxButton ;
	var img1 : FlxSprite;
	var timer : FlxTimer;
	var timer2 : FlxTimer;
	var img2: FlxSprite;
	var img3: FlxSprite;
	var img4 :FlxSprite;
	var aux : Bool = false;
	
	var p : String = "";
	
	override public function create():Void 
	{
		super.create();
		btn  = new FlxButton(0, 0,"" , jugar);
		btn.loadGraphic(AssetPaths.btnjugar__png, true, 80, 20);
		btn.setGraphicSize(240, 60);
		btn.updateHitbox();

		btn2  = new FlxButton(0,50, "", links);
		btn2.loadGraphic(AssetPaths.btnpropuestas__png, true, 80, 20);
		btn2.setGraphicSize(240, 60);
		btn2.updateHitbox();
	
		
		btn.visible = false;
		btn2.visible = false;
		
		img1 = new FlxSprite(0, 0);
		img1.loadGraphic(AssetPaths.placas_juego_14b__png);
		add(img1);
		img1.alpha = 0;
	
		
		img2 = new FlxSprite(0, 0);
		img2.loadGraphic(AssetPaths.placas_juego_menu__png);
		add(img2);
		img2.visible = false;
		
		
		timer2 = new FlxTimer();
		timer2.start(0.05, changealpha, 20);
		
		timer = new FlxTimer();
		timer.start(2, changescreen, 1);
		
		
		add(btn);
		add(btn2);
		
		btn.setPosition(FlxG.width / 3 * 2 - Std.int(btn.width) / 2, FlxG.height / 2 );
		btn2.setPosition(FlxG.width / 3 * 2 - Std.int(btn2.width) / 2, FlxG.height / 2 + btn.height + 15);

		
	
	}
	
	
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (aux){
			if (FlxG.mouse.justPressed){
				trace(FlxG.mouse.x + "   " + FlxG.mouse.y);
				var x = FlxG.mouse.x;
				var y = FlxG.mouse.y;
				
				if (x > 41 && x < 425 && y > 188 && y < 576){
					p = "itai";
					aux = false;
				}
				
				if ( x > 536 && x < 920 && y > 188 && y < 576){
				    p = "eli";
					aux = false;
				}
			}
			
			if (!aux){
				img4 = new FlxSprite(0, 0);
				img4.loadGraphic(AssetPaths.placas_juego_01__png);
				add(img4);
				img3.visible = false;
				
				timer2.start(2.5, startchange, 1);
			}
			
		}
	}
	
	public function startchange(tmr: FlxTimer){
		timer.start(0.05, changealpha2, 20);
	}
	
	public function changealpha2(tmr: FlxTimer){
		img4.alpha -= 0.05;
		if (img4.alpha == 0){
			PlayState.txtP = p;
			FlxG.switchState(new PlayState());
		}
	}
	
	
	public function changealpha(tmr: FlxTimer){
		img1.alpha += 0.05;
	}
	
	public function changescreen(tmr: FlxTimer){
		
		img1.visible = false;
		img2.visible = true;
		btn.visible = true;
		btn2.visible = true;
	}
	
	
	public function links(){
		
	/*	var http : Http = new Http("Ahorabuenosaires.info");
		http.onError("error");
		http.onData("kul");
		http.request();
	    
		trace(http.responseData); */
		
		Lib.getURL(new URLRequest("https://ahorabuenosaires.info/propuestas/"));
		
	}
	public function jugar(){
		btn.visible = false;
		btn2.visible = false;
		img3 = new FlxSprite(0, 0);
		img3.loadGraphic(AssetPaths.placas_juego_06__png);
		add(img3);
		aux = true;
	}
}