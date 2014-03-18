package ;
import flash.display.Sprite;
import flash.Lib;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;

/**
 * ...
 * @author Johnnyappseed
 */

class Menu extends Sprite 
{
	var titleBox:TextField;
	var titleFormate:TextFormat;
	var playBox:TextField;
	
	public function new() 
	{
		super();
		
		//this.graphics.beginFill(0xFFFFFF, 0.8);
		var spriteBox = new Sprite();
		titleFormate = new TextFormat();
        titleFormate.font = "Times New Roman";
        titleFormate.size = 40;               
        titleFormate.color=0xFFFFFF;
        titleBox = new TextField();
        titleBox.text = "Keep on Rollin!";
        titleBox.setTextFormat(titleFormate);
        this.addChild(titleBox);
		titleBox.width = 400;
		titleBox.x = 300;
		titleBox.y = this.height / 4;
		
        titleFormate.size = 32;               
        titleFormate.color=0xFFFFFF;
        playBox = new TextField();
        playBox.text = "Play!";
        playBox.setTextFormat(titleFormate);
        spriteBox.addChild(playBox);
		this.addChild(spriteBox);
		//playBox.width = 300;
		playBox.x = playBox.width / 2;
		playBox.y = playBox.height / 2;
		spriteBox.x = 400;
		spriteBox.y = 300;
		
		
		spriteBox.addEventListener(MouseEvent.MOUSE_DOWN, play);
		
		
	}
	
	function play(e)
	{
		Main.Bmain.play();
	}
}
