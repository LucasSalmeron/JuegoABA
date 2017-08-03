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
	
	
	var img5: FlxSprite;
	
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
		
		btn.setPosition(FlxG.width / 3 * 2 - Std.int(btn.width) / 2, FlxG.height / 2  + 20);
		btn2.setPosition(FlxG.width / 3 * 2 - Std.int(btn2.width) / 2, btn.y + btn.height + 15);

		
		FlxG.sound.playMusic("assets/inicio.ogg");
		
		img5 = new FlxSprite(0, 0);
		img5.loadGraphic(AssetPaths.seleccionador__png);
		img5.visible = false;
		
		
		
	
	}
	
	
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);

		
		if (aux){
			var x = Entrada.getX();
			var y = Entrada.getY();
			if (Entrada.getClick()){
				
				
				if (x > 41 && x < 425 && y > 103 && y < 473){
					FlxG.sound.play("assets/Select.ogg");
					p = "itai";
					
					aux = false;
				}
				
				if ( x > 536 && x < 920 && y > 103 && y < 473){
					FlxG.sound.play("assets/Select.ogg");
				    p = "eli";
					
					aux = false;
				}
			}else{
				
				img5.visible = false;
				
				if (x > 41 && x < 425 && y > 103 && y < 473){
					
				     img5.visible = true;
					 img5.setPosition(41,  103);
				}
				
				if ( x > 536 && x < 920 && y > 103 && y < 473){
				
					img5.visible = true;
					img5.setPosition(536,  103);
				}
			}
			
			if (!aux){
				img4 = new FlxSprite(0, 0);
				img4.loadGraphic(AssetPaths.placas_juego_01__png);
				add(img4);
				img3.visible = false;
				img5.visible = false;
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
			FlxG.sound.music.fadeOut(1, 0);
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
		FlxG.sound.play("assets/Select.ogg");

		Lib.getURL(new URLRequest("https://ahorabuenosaires.info/propuestas/"));
		
	}
	public function jugar(){
		FlxG.sound.play("assets/Select.ogg");
		btn.visible = false;
		btn2.visible = false;
		img2.visible = false;
		img3 = new FlxSprite(0, 0);
		img3.loadGraphic(AssetPaths.placas_juego_06__png);
		
		img4 = new FlxSprite(0, 0);
		img4.loadGraphic(AssetPaths.placas_juego_nada__png);
		add(img4);
		add(img3);
		add(img5);
		aux = true;
	}
}