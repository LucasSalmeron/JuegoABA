package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Enemigo extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Boss__png, true, 32, 32);
		animation.add("caminar", [0, 1, 2, 3], 12);
		animation.play("caminar");
		
		setGraphicSize(64, 64);
		updateHitbox();
		
		velocity.set(-50, 0);
		flipX = true;
		
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	
	
}