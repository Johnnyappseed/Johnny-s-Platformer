package ;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.MouseEvent;
import openfl.Assets;

//import flash.media.Sound;
//Assets.media.sound
//import flash.geom.Matrix;


/**
 * ...
 * @author Johnnyappseed
 */
class My_Dude extends Sprite
{

	var vx:Float;
	var vy:Float;
	var floatx:Float;
	var floaty:Float;
	var image_Sprite:Sprite;
	var count:Int;
	var hitSprite:Sprite;
	var spin:Float;
	var rotate:Int;
	var image:Bitmap;
	public var speedK:Float;
	
	
	public function new() 
	{
		//var spritesheet:spritesheet = BitmapImporter.create(Assets.getBitmapData("img/kit_from_firefox.png"), 3, 9, 56, 80);
		
		super();
		speedK = .3;
		image = new Bitmap(Assets.getBitmapData("img/gear_a.png"));
		spin = 0;
		image.x = -20;
		image.y = -20;
		image.width = 40;
		image.height = 40;
		image_Sprite = new Sprite();
		image_Sprite.addChild(image);
		this.addChild(image_Sprite);
		//this.graphics.beginFill(0xFF0000);
		//this.graphics.drawRoundRect( -20, -20, 40, 40, 4);
		//this.graphics.drawCircle(0, 0, 21);
		this.x = 100;
		this.y = 100;
		this.floatx = this.x;
		this.floaty = this.y;
		vx = 0;
		vy = 0;
		count = 0;
		hitSprite = new Sprite();
		//hitSprite.graphics.beginFill(0x00FF00);
		hitSprite.graphics.drawCircle(0, 0, 16);
		hitSprite.mouseEnabled = false;
		this.addChild(hitSprite);
		
	}
	
	public function restart()
	{
		image_Sprite.removeChild(image);
		image = new Bitmap(Assets.getBitmapData("img/gear_a.png"));
		image_Sprite.addChild(image);
		spin = 0;
		image.x = -20;
		image.y = -20;
		image.width = 40;
		image.height = 40;
		this.x = 100;
		this.y = 100;
		this.vx = 0;
		this.vy = 0;
		this.floatx = this.x;
		this.floaty = this.y;
		vx = 0;
		vy = 0;
		count = 0;
	}
	
	public function color()
	{
		image_Sprite.removeChild(image);
		image = new Bitmap(Assets.getBitmapData("img/C_Wheel_a.png"));
		image_Sprite.addChild(image);
		spin = 0;
		image.x = -20;
		image.y = -20;
		image.width = 40;
		image.height = 40;
	}
	
	public function gear()
	{
		image_Sprite.removeChild(image);
		image = new Bitmap(Assets.getBitmapData("img/gear_a.png"));
		image_Sprite.addChild(image);
		spin = 0;
		image.x = -20;
		image.y = -20;
		image.width = 40;
		image.height = 40;
	}
	
	public function left()
	{
		this.vx -= speedK;
	}
	
	public function right()
	{
		this.vx += speedK;
	}
	
	public function isColliding()
	{

		for (platform in GameCanvas.game.platforms)
		{
			if (hitSprite.hitTestObject(platform))
			{
				return true;
			}
		}
		return false;
	}
	
	public function onGround()
	{
		if (isColliding()) return false;
		this.y += 1;
		var a = isColliding();
		this.y -= 1;
		return a;
		
	}
	
	public function act()
	{
		count += 1;
		speedK = .3;
		
		//this.graphics.clear();
		//var m:Matrix = new Matrix();
		
		//m.translate(56*(Std.int(count/20)%9), 160);
		//this.graphics.beginBitmapFill(image,m);
		//this.graphics.drawRect(0, 0, 56, 80);
		
		onGround();
		//trace("ground");
		
		
		this.floaty += this.vy;
		this.y = Std.int(this.floaty);
		if (isColliding())
		{
			this.floaty -= this.vy;
			this.y = Std.int(this.floaty);
			this.vy = 0;
		}
		
		this.floatx += this.vx;
		this.x = Std.int(this.floatx);
		if (isColliding())
		{
			this.floatx -= this.vx;
			this.x = Std.int(this.floatx);
			this.vx = 0;
		}
		if (this.y + GameCanvas.game.y > 460)
		{
			this.floaty -= this.vy;
			this.y = Std.int(this.floaty);
			this.vy = 0;
		}
		
		if (this.y + GameCanvas.game.y < 10)
		{
			//trace(this.y + GameCanvas.game.y);
			GameCanvas.game.died();
		}
		
		this.vy += .4;
		
		this.vx *= .95;
		spin = vx;
		rotate += Std.int(spin*1.9);
		image_Sprite.rotation = rotate;
		
		//this.vy *= .6;
		//if (Math.abs(this.vy) < .01) this.vy = 0;
		//if (Math.abs(this.vx) < .01) this.vx = 0;
	}
	
}