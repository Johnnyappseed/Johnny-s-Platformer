package ;
import flash.display.Sprite;
import flash.Lib;
import flash.events.Event;
import flash.events.KeyboardEvent;

/**
 * ...
 * @author Johnnyappseed
 */

class GameCanvas extends Sprite 
{

	public var dude:My_Dude;
	var score:Score;
	var keys:Array<Int>;
	public var platforms:Array<Platform>;
	public static var game:GameCanvas;
	var speed:Int;
	var counter:Int;

	public function new() 
	{
		super();
		speed = 90;
		counter = 0;
		platforms = new Array<Platform>();
		dude = new My_Dude();
		score = new Score();
		this.addChild(dude);
		//var p = new Platform(100,300,100,1);
		//platforms.push(p);
		//this.addChild(p);
		//p = new Platform(100,300,100,2);
		//platforms.push(p);
		//this.addChild(p);
		//var p = new Platform(100,300,100,3);
		//platforms.push(p); 
		//this.addChild(p);
		//p = new Platform(100,300,100,4);
		//platforms.push(p);
		//this.addChild(p);
		game = this;
		
		keys = new Array<Int>();
	}
	
	public function act(e:Event):Void
	{
		counter += 1;
		var platformY = -(this.y - 480);
		for (platform in platforms)
		{
			platform.refresh(platformY);
		}
		dude.act();
		//this.x = -dude.x + 200;
		this.y = this.y-1;
		
		if (counter % speed == 0)
		{
			//trace(dude.y+this.y);
			var randomX = (Std.int(Math.random() * 720) + 40);
			var p = new Platform(platformY,randomX,100,1);
			platforms.push(p);
			this.addChild(p);
			p = new Platform(platformY,randomX,100,2);
			platforms.push(p);
			this.addChild(p);
			var p = new Platform(platformY,randomX,100,3);
			platforms.push(p);
			this.addChild(p);
			p = new Platform(platformY,randomX,100,4);
			platforms.push(p);
			this.addChild(p);
		}
		if (keyCheck(37)) dude.left();
		if (keyCheck(39)) dude.right();
		
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
		speed = 90;
		counter = 0;
		score.restart();
		dude.restart();
		for (platform in platforms)
		{
			platforms.remove(platform);
			this.removeChild(platform);
		}
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

