package ;

import flash.display.Sprite;
import flash.Lib;
import openfl.Assets;
import flash.events.Event;
//import motion.Actuate;
import flash.events.MouseEvent;
//import motion.easing.Elastic;
//import flash.media.Sound;
//import flash.media.SoundChannel;
//import flash.media.SoundTransform;
import motion.Actuate;

/**
 * ...
 * @author Johnnyappseed
 */

class Main extends Sprite 
{

	var inited = false;
	var gameCanvas:GameCanvas;
	public var menu:Menu;
	public static var Bmain:Main;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
	}
	
	/* SETUP */

	public function new() 
	{
		super();	
		Bmain = this;
		gameCanvas = new GameCanvas();
		this.addChild(gameCanvas);
		
		menu = new Menu();
		this.addChild(menu);
		var background = Assets.getSound("music/dWind.mp3");
		background.play(0,-1);
		
		addEventListener(Event.ADDED_TO_STAGE, added);
	}
	
	public function play()
	{
		Actuate.tween(menu, 2, { x:0, y:-600 } );
		gameCanvas.enable();
	}
	
	public function died()
	{
		Actuate.tween(menu, 2, { x:0, y:0 } );
		gameCanvas.disable();
		gameCanvas.restart();
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
