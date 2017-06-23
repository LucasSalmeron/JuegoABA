package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Personaje extends FlxSprite 
{

	private var aux:Bool = false;
	private var invisibleBox : FlxSprite;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.advnt_full__png, true, 32, 64);
        FlxG.state.add(this);
		
		this.animation.add("caminar", [1,2,3,4,5,6],12);
		this.animation.add("idle", [0]);
		this.animation.add("golpe", [27, 28, 0], 10, false);
		
		this.animation.play("idle");
		this.setGraphicSize(64, 128);
		this.updateHitbox();
		
		
		invisibleBox = new FlxSprite(0, 0);
		invisibleBox.makeGraphic(20, 15);
		FlxG.state.add(invisibleBox);
	}
	
	override public function update(elapsed: Float){
		super.update(elapsed);
		if (FlxG.keys.justReleased.LEFT || FlxG.keys.justReleased.RIGHT){
			if (this.animation.name == "caminar"){
				this.animation.stop();
				this.animation.play("idle");
			}
		}
		
		if (FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT){
			if (this.animation.name == "caminar"){
				this.animation.stop();
				this.animation.play("idle");
			}
		}
		
		if (FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.RIGHT){
			this.animation.play("caminar");
		}
		
		if (FlxG.keys.pressed.LEFT && !FlxG.keys.pressed.RIGHT){
			set_flipX(true);
		    this.x -= 5;
			FlxG.camera.scroll.add( -5, 0);
			if (animation.name == "idle"){
				animation.stop();
				animation.play("caminar");
			}
		}
		
		if (FlxG.keys.pressed.RIGHT && !FlxG.keys.pressed.LEFT){
			set_flipX(false);
		    this.x += 5;
			FlxG.camera.scroll.add(5, 0);
			if (animation.name == "idle"){
				animation.stop();
				animation.play("caminar");
			}
		}
		
		if (FlxG.keys.justPressed.SPACE){
			animation.play("golpe");
			aux = true;
		}
		if (aux){
			if (animation.name == "golpe" && animation.frameIndex == 28){
				if (this.flipX){
					invisibleBox.setPosition(x - invisibleBox.width, y + height / 2);
				}
				else
				{
					invisibleBox.setPosition(x + width, y + height/2);
				}
				aux = false;
			}
			
		}
	
		
	}
}