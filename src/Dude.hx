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
class Dude extends Sprite
{

	var vx:Float;
	var vy:Float;
	var floatx:Float;
	var floaty:Float;
	//var airJumpCount:Int;
	//var image:BitmapData;
	var count:Int;
	
	
	public function new() 
	{
		//var spritesheet:spritesheet = BitmapImporter.create(Assets.getBitmapData("img/kit_from_firefox.png"), 3, 9, 56, 80);
		
		super();
		var image = new Bitmap(Assets.getBitmapData("img/gear_a.png"));
		image.x = -20;
		image.y = -20;
		//image.width = 40;
		//image.height = 40;
		this.addChild(image);
		this.graphics.beginFill(0xFF0000);
		//this.graphics.drawRoundRect( -20, -20, 40, 40, 4);
		//this.graphics.drawCircle(0, 0, 21);
		this.x = 100;
		this.y = 100;
		this.floatx = this.x;
		this.floaty = this.y;
		vx = 0;
		vy = 0;
		//airJumpCount = 0;
		count = 0;
		//var s = new Sprite();
		//s.graphics.beginFill(0x00FF00);
		//s.graphics.drawCircle(0, 0, 2);
		//s.mouseEnabled = false;
		//this.hitArea = s;
		
	}
	
	public function left()
	{
		this.vx -= .2;
	}
	
	public function right()
	{
		this.vx += .2;
	}
	
	public function jump()
	{
		var v = onGround();
		if (v)
		{
			this.vy = -4;
			airJumpCount = 0;
		}
		else if(airJumpCount<1)
		{
			this.vy = -4;
			airJumpCount += 1;
		}
	}
	
	public function isColliding()
	{

		for (platform in GameCanvas.game.platforms)
		{
			if (this.hitTestObject(platform))
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
		
		//this.graphics.clear();
		//var m:Matrix = new Matrix();
		
		//m.translate(56*(Std.int(count/20)%9), 160);
		//this.graphics.beginBitmapFill(image,m);
		//this.graphics.drawRect(0, 0, 56, 80);
		
		if (onGround()) trace("ground");
		//trace(airJumpCount);
		
		
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
		
		this.vy += .1;
		
		this.vx *= .94;
		//this.vy *= .6;
		//if (Math.abs(this.vy) < .01) this.vy = 0;
		//if (Math.abs(this.vx) < .01) this.vx = 0;
	}
	
}