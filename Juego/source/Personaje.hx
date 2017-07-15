package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;
/**
 * ...
 * @author ...
 */
class Personaje extends FlxSprite 
{

	private var aux:Bool = false;
	public var invisibleBox : FlxSprite;
	public var enemigos : FlxGroup;
	public var vida : Int = 5;
	public var cont : Int = 0; //borrar despues
public var score : Int = 0;


var auxxxxxxxx: Bool = false;
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
		this.setSize(32, 128);
		this.centerOffsets();
		
		enemigos = new FlxGroup();
		invisibleBox = new FlxSprite(0, 0);
		invisibleBox.makeGraphic(40, 15, FlxColor.TRANSPARENT);
		FlxG.state.add(invisibleBox);
		
		
	}
	
	override public function update(elapsed: Float){
		super.update(elapsed);
		cont++;
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
			if(FlxG.worldBounds.x < x - 20){  
			set_flipX(true);
		    x -= 5;
			FlxG.camera.scroll.add( -5, 0);
			if (animation.name == "idle"){
				animation.stop();
				animation.play("caminar");
			}
		}
		else{
			animation.stop();
			animation.play("idle");
		}
		
		}
		
		
		if (FlxG.keys.pressed.RIGHT && !FlxG.keys.pressed.LEFT){
			if(FlxG.worldBounds.x + FlxG.worldBounds.width > x + width +  20){  
			set_flipX(false);
		    x += 5;
			FlxG.camera.scroll.add(5, 0);
			if (animation.name == "idle"){
				animation.stop();
				animation.play("caminar");
				
			}
		}
		else{
			animation.stop();
			animation.play("idle");
		}
		
		}
		
		if (FlxG.keys.justPressed.SPACE|| !auxxxxxxxx){
			animation.play("golpe");
			aux = true;
			auxxxxxxxx = true;
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
				FlxG.overlap(invisibleBox, enemigos, matarenemigo);
				
				aux = false;
			}
			
		}
		
		

		
		
	}
	
	public function atacado(){
		vida--;
		if (vida == 0){
			FlxG.switchState(new PlayState());
		}
	}
	
	public function matarenemigo(obj1 : FlxObject, obj2: FlxObject):Void{
		
		obj2.kill();
		score += 10;
	}
	
}