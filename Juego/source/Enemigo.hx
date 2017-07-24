package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxTween.TweenCallback;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{

	var personaje : Personaje;
	var ataco : Bool = false;
	var cont : Int = 0;
	
	var velocidad : Int;
	public function new(?X:Float=0, ?Y:Float=0, _p : Personaje) 
	{
		super(X, Y);
		var n = Std.random(2);
		
		if (n == 0){
			loadGraphic(AssetPaths.lousteau__png, true, 133, 266);
		}else{
			loadGraphic(AssetPaths.lilita__png, true, 133, 266);
		}
		this.y = _p.y;
		
		this.animation.add("caminar", [1,2,3,4,5,6],12);
		this.animation.add("golpe", [27, 28, 0], 10, false);
		this.animation.play("caminar");
		this.animation.add("muerte", [51, 52], 8, false);
		this.setGraphicSize(64, 128);
		this.updateHitbox();
		this.setSize(32, 128);
		this.centerOffsets();
		
		velocidad = 30 +Std.int( _p.score / 2000);
		if (velocidad < 50){ velocidad = 50;}
		
		
		if (x < _p.x){
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
		cont++;
		if (!ataco){
			var dist;
			if (this.x > personaje.x){
				dist = this.x - personaje.x;
			}else{
				dist = personaje.x - this.x;
			}
			
			if (dist < 50){
				animation.play("golpe");
			}
			
		}
		
		if (animation.name == "golpe" && animation.frameIndex == 28 && this.alive){
			
			
			var invisibleBox = new FlxSprite(0, 0);
		invisibleBox.makeGraphic(40, 15, FlxColor.TRANSPARENT);
		FlxG.state.add(invisibleBox);
		if (this.flipX){
					invisibleBox.setPosition(x - invisibleBox.width, y + height / 2);
				}
				else
				{
					invisibleBox.setPosition(x + width, y + height/2);
				}
				FlxG.overlap(personaje, invisibleBox, atacar);
				
				invisibleBox.destroy();
				
		}
		
		
		
		
		
		
	}
	
	public function atacar(p : FlxObject, o: FlxObject):Void{
		if (alive){
			FlxG.sound.play(AssetPaths.AtaqueMalo__wav);
		ataco = true;
		personaje.atacado();
		kill();
		}
	}
	
	
	
	override public function kill():Void 
	{
		set_alive(false);
		animation.stop();
		animation.play("muerte");
		velocity.set(0, 0);
		FlxSpriteUtil.fadeOut(this, 0.3, onComplete);
		
	}
	
	public function onComplete(tween: FlxTween): Void{
		super.kill();
		
		
	}
}