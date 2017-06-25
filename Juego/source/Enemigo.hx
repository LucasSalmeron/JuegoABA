package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenCallback;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{

	var personaje : Personaje;
	
	public function new(?X:Float=0, ?Y:Float=0, _p : Personaje) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.Boss__png, true, 32, 32);
		animation.add("caminar", [0, 1, 2, 3], 12);
		animation.play("caminar");
		
		setGraphicSize(64, 64);
		updateHitbox();
		
		if (x < FlxG.worldBounds.width/2){
			velocity.set(50, 0);
		}else{
			velocity.set(-50, 0);
		flipX = true;
		}
		
		
		personaje = _p;
		
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		
		
		
	}
	
	
	
	override public function kill():Void 
	{
		set_alive(false);
		FlxSpriteUtil.fadeOut(this, 1, onComplete);
	}
	
	public function onComplete(tween: FlxTween): Void{
		super.kill();
		trace("killed");
	}
}