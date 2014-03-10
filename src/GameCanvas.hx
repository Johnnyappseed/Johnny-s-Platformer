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
	var keys:Array<Int>;
	public var platforms:Array<Platform>;
	public static var game:GameCanvas;

	public function new() 
	{
		super();
		platforms = new Array<Platform>();
		dude = new My_Dude();
		this.addChild(dude);
		var p = new Platform(50,500,150,1);
		platforms.push(p);
		this.addChild(p);
		p = new Platform(50,500,150,2);
		platforms.push(p);
		this.addChild(p);
		//p = new Platform(10, 10, 10, 600);
		//platforms.push(p);
		//this.addChild(p);
		//p = new Platform(1000, 10, 10, 1000);
		//platforms.push(p);
		//this.addChild(p);
		game = this;
		
		keys = new Array<Int>();
		enable();
	}
	
	public function act(e:Event):Void
	{
		dude.act();
		this.x = -dude.x + 200;
		this.y = -dude.y + 200;
		if (keyCheck(37)) dude.left();
		if (keyCheck(39)) dude.right();
	}
	
	public function keyDown(e:KeyboardEvent):Void
	{
		if (! keyCheck(e.keyCode)) keys.push(e.keyCode);
		if (38==e.keyCode) dude.jump();
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

