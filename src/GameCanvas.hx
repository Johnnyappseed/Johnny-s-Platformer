package ;
import flash.display.Sprite;
import flash.Lib;
import flash.events.Event;
import flash.events.KeyboardEvent;
import motion.Actuate;

/**
 * ...
 * @author Johnnyappseed
 */

class GameCanvas extends Sprite 
{

	public var dude:My_Dude;
	public var score:Score;
	var keys:Array<Int>;
	public var platforms:Array<Platform>;
	public static var game:GameCanvas;
	var platSpawnMod:Int;
	var startPlatSpawnMod:Int;
	var upSpawnMod:Int;
	var startUpSpawnMod:Int;
	var frameCounter:Int;
	var dropSpeed:Float;
	public var upgrade:Upgrade;
	var bomb:Bool;
	var speed:Bool;
	var bar:Sprite;
	var speedTimer:Int;
	var changeTime:Bool;
	var changeTimer:Int;
	var startPlatColor:Int;
	var platColor:Int;

	public function new() 
	{
		super();
		startPlatColor = 0xFFCCCC;
		platColor = startPlatColor;
		changeTime = false;
		changeTimer = 0;
		speedTimer = 0;
		bomb = false;
		speed = false;
		dropSpeed = 1;
		startPlatSpawnMod = 100;
		platSpawnMod = startPlatSpawnMod;
		startUpSpawnMod = 1000;
		upSpawnMod = startUpSpawnMod;
		frameCounter = 1;
		platforms = new Array<Platform>();
		dude = new My_Dude();
		score = new Score();
		upgrade = new Upgrade(0);
		upgrade.y = 550;
		this.addChild(upgrade);
		bar = new Sprite();
		var barImage = new Sprite();
		barImage.graphics.beginFill(0xFF0000);
		barImage.graphics.drawRoundRect(0, 0, 800, 10, 4);
		barImage.x = -400;
		barImage.y = -5;
		bar.x = 400;
		bar.y = 0;
		bar.addChild(barImage);
		this.addChild(bar);
		this.addChild(score);
		this.addChild(dude);
		game = this;
		keys = new Array<Int>();
	}
	
	public function act(e:Event):Void
	{
		var platformY = -(this.y - 480);
		if (frameCounter % 1800==0)
		{
			changeTime = true;
			changeTimer = 300;
			platColor = Std.random(0xFFFFFF);
			if (platSpawnMod >= 60)
			{
				platSpawnMod = platSpawnMod - 10;
				upSpawnMod = upSpawnMod + 30;
			}
			var randomX = (Std.int(Math.random() * 720) + 40);
			var p = new Platform(platformY,randomX,100,5,platColor);
			platforms.push(p);
			this.addChild(p);
			p = new Platform(platformY,randomX,100,6,platColor);
			platforms.push(p);
			this.addChild(p);
		}
		dude.act();
		if (changeTime == true)
		{
			dude.speedK = .5;
			changeTimer -= 1;
			if (changeTimer <= 0)
			{
				changeTime = false;
			}
		}
		Main.Bmain.menu.act();
		upgrade.act();
		this.y = this.y - dropSpeed;
		score.y = score.y + dropSpeed;
		bar.y = bar.y + dropSpeed;
		
		frameCounter += 1;
		
		
		for (platform in platforms)
		{
			platform.refresh(platformY);
		}
		
		if (frameCounter % upSpawnMod == 0 && changeTime == false)
		{
			this.removeChild(upgrade);
			upgrade = new Upgrade(Std.int(Math.random() * 2));
			upgrade.x = Std.int(Math.random() * 720) + 40;
			upgrade.y = -this.y - 25;
			this.addChild(upgrade);
		}
		
		if (frameCounter % platSpawnMod == 0 && changeTime == false)
		{
			var randomX = (Std.int(Math.random() * 720) + 40);
			var p = new Platform(platformY,randomX,100,1,platColor);
			platforms.push(p);
			this.addChild(p);
			p = new Platform(platformY,randomX,100,2,platColor);
			platforms.push(p);
			this.addChild(p);
			var p = new Platform(platformY,randomX,100,3,platColor);
			platforms.push(p);
			this.addChild(p);
			p = new Platform(platformY,randomX,100,4,platColor);
			platforms.push(p);
			this.addChild(p);
		}
		
		if (bomb == true)
		{
			for (plateform in platforms)
			{
				if (plateform.killLevel > 100)
				{
					plateform.killLevel = plateform.killLevel - 4;
				}
				else 
				{
					plateform.killLevel = 480;
					bomb = false;
				}
			}
			if (bar.y > -this.y + 400)
			{
				bomb = false;
			}
			bar.y = bar.y + 4;
			if (platforms.length == 0)
			{
				bomb = false;
			}
			if (bomb == false)
			{
				Actuate.tween(bar, 3, { y: -this.y + (dropSpeed * 60 * 3) } );
				for (plateform in platforms)
				{
					plateform.killLevel = 480;
				}
			}
		}
		
		if (speed == true)
		{
			speedTimer -= 1;
			if (speedTimer <= 0)
			{
				speed = false;
				dude.gear();
			}
			dude.speedK = .6;
		}
		
		if (keyCheck(37)) dude.left();
		if (keyCheck(39)) dude.right();
		
		if (Math.abs(dude.x - upgrade.x) < 50 && Math.abs(dude.y - upgrade.y) < 25)
		{
			if (upgrade.type == 0)
			{
				bomb = true;
			}
			if (upgrade.type == 1)
			{
				speed = true;
				speedTimer = 300;
				dude.color();
			}
			upgrade.y=-this.y+550;
		}
	}
	
	public function barMotion()
	{
		Actuate.transform(bar, .5).color(0x000000, 1).onComplete(afterBar);
	}
	
	function afterBar()
	{
		Actuate.transform(bar, .5).color(0xFF0000, 1);
	}
	
	public function died()
	{
		Main.Bmain.died();
	}
	
	public function keyDown(e:KeyboardEvent):Void
	{
		if (! keyCheck(e.keyCode)) keys.push(e.keyCode);
	}
	
	
	public function keyUp(e:KeyboardEvent):Void
	{
		keys.remove(e.keyCode);
	}
	
	function keyCheck(v:Int):Bool
	{
		for (item in keys)
		{
			if (item == v) return true;
		}
		return false;
		
	}
	
	public function restart()
	{
		this.y = 0;
		upSpawnMod = startUpSpawnMod;
		platSpawnMod = startPlatSpawnMod;
		platColor = startPlatColor;
		frameCounter = 0;
		score.restart_s(0);
		score.y = 0;
		dude.restart();
		for (platform in platforms)
		{
			this.platforms.remove(platform);
			this.removeChild(platform);
		}
		this.removeChild(upgrade);
		upgrade = new Upgrade(0);
		upgrade.y = 500;
		this.addChild(upgrade);
		keys.pop();
		bar.x = 400;
		bar.y = 0;
		
	}
	
	public function disable()
	{
		Lib.current.stage.removeEventListener(Event.ENTER_FRAME, act);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
	}
	
	public function enable()
	{
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, act);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
	}
}

