package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxButton;
/**
 * ...
 * @author ...
 */
class EndState extends FlxState 
{

    override public function create():Void 
	{
		super.create();
	//	FlxG.sound.music.stop();
				var spr : FlxSprite = new FlxSprite(0, 0);
		if (PlayState.txtP == "Victoria"){
	//		FlxG.sound.play(AssetPaths.VictoriaSonido__wav);
	//FlxG.sound.playMusic(AssetPaths.victoria__wav);
			spr.loadGraphic(AssetPaths.placas_juego_09__png);
		}else if (PlayState.txtP == "Derrota"){
		//FlxG.sound.play(AssetPaths.DerrotaSonido__wav);
		//FlxG.sound.playMusic(AssetPaths.derrota__wav);
			spr.loadGraphic(AssetPaths.placas_juego_14__png);
		}
		add(spr);
		
		var btn : FlxButton = new FlxButton(0, 0, "", reiniciar);
			btn.loadGraphic(AssetPaths.btnvolverajugar__png, true, 80, 20);
			add(btn);
			
			btn.setGraphicSize(240, 60);
		
		btn.setPosition(FlxG.width / 2 - btn.width / 2, FlxG.height / 2 );
	}
	
	public function reiniciar(){
	//	FlxG.sound.music.stop();
	//	FlxG.sound.play(AssetPaths.Select__wav);
		FlxG.switchState(new MenuState());
	}
	
}