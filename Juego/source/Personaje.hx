package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
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
	public var enemigos : FlxSpriteGroup;
	public var vida : Int = 5;

public var score : Int = 0;

var auxxxxxxxx: Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		if(PlayState.txtP == "itai"){
		loadGraphic(AssetPaths.itai__png, true, 133, 266); }
		else{
			loadGraphic(AssetPaths.eli__png, true, 133, 266);
		}
        FlxG.state.add(this);
		
		this.animation.add("caminar", [1,2,3,4,5,6],12);
		this.animation.add("idle", [0]);
		this.animation.add("golpe", [27, 28,0], 10, false);
		this.animation.play("idle");
		this.setGraphicSize(64, 128);
		this.updateHitbox();
		this.setSize(32, 128);
		this.centerOffsets();
		
		enemigos = new FlxSpriteGroup();
		invisibleBox = new FlxSprite(0, 0);
		invisibleBox.makeGraphic(40, 15, FlxColor.TRANSPARENT);
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
			if(FlxG.worldBounds.x < x - 20){  
			set_flipX(true);
		    x -= 4;
			FlxG.camera.scroll.add( -4, 0);
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
		    x += 4;
			FlxG.camera.scroll.add(4, 0);
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
		
		if (animation.name == "golpe" && animation.frameIndex == 0){
			animation.stop();
			animation.play("idle");
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
		
		
		
		
		
		if (FlxG.keys.justPressed.D){
			animation.play("idle");
		}
		
	}
	
	public function atacado(){
		vida--;
		if (vida == 0){
			PlayState.txtP = "Derrota";
			FlxG.switchState(new EndState());
		}
	}
	
	public function matarenemigo(obj1 : FlxObject, obj2: FlxObject):Void{
		obj2.kill();
		score += 1000;
		PlayState.conte -= 1;
			FlxG.sound.play("assets/AtaqueBueno.ogg");
			crearEnemigo();
		
		
		if (score == 100000){
			PlayState.txtP = "Victoria";
			FlxG.switchState(new EndState());
		}
	}
	
public function crearEnemigo(){
				var _x : Int;
				var enemigo : Enemigo;
		do{
			_x = Std.random(Std.int(FlxG.worldBounds.width+3000));
			_x = _x - 1500;
			for(e in 0...enemigos.length){
			if (_x < enemigos.members[e].x + 50 && _x >enemigos.members[e].x  - 50){
					_x = Std.int(x);
				}
			}
			}while (_x > x -500 && _x < x +500);
			enemigo = new Enemigo(_x, 370 + height - 64, this);
			enemigos.add(enemigo);
			PlayState.conte++;
			
	}
	

	
}