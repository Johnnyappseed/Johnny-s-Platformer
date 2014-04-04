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
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */

class Menu extends Sprite 
{
	var titleBox:TextField;
	var titleFormate:TextFormat;
	var playBox:TextField;
	var score:Score;
	var img:Bitmap;
	var roll:Bool;
	var spin:Float;
	var sint:Int;
	var imageS:Sprite;
	var mm:Int;
	
	public function new() 
	{
		var playbut = new Sprite();
		playbut.graphics.beginFill(0xFFFFFF, .3);
		playbut.graphics.drawRoundRect(310, 230, 75, 50, 4);
		super();
		mm = 100;
		roll = false;
		spin = 0.0;
		sint = 0;
		imageS = new Sprite();
		img = new Bitmap(Assets.getBitmapData("img/C_Wheel_a.png"));
		img.height = 480;
		img.width = 480;
		img.x = -240;
		img.y = -240;
		imageS.x = 240+mm;
		imageS.y = 240;
		var spriteBox = new Sprite();
		titleFormate = new TextFormat();
        titleFormate.font = "Times New Roman";
        titleFormate.size = 40;               
        titleFormate.color=0xFFFFFF;
        titleBox = new TextField();
        titleBox.text = "Keep on Rollin!";
        titleBox.setTextFormat(titleFormate);
		titleBox.width = 400;
		titleBox.x = 200+mm-55;
		titleBox.y = this.height / 4;
		
		
        titleFormate.size = 32;               
        titleFormate.color=0xFFFFFF;
        playBox = new TextField();
        playBox.text = "Play!";
		titleFormate.size = 65;
        playBox.setTextFormat(titleFormate);
		playBox.x = 12;
		playBox.y = 16;
        spriteBox.addChild(playBox);
		this.addChild(playbut);
		//playBox.width = 300;
		//playBox.x = 50;
		playBox.y = (playBox.height / 2)-(playBox.height/2);
		spriteBox.x = 350+mm-140;
		spriteBox.y = 230;
		spriteBox.width = 75;
		spriteBox.height = 50;
		
		var intro = new TextField();
		intro.text = "Info: Left &\nRight Arrow Keys";
		intro.width = 275;
		titleFormate.size = 30;
		intro.setTextFormat(titleFormate);
		intro.x = 0;
		intro.y = 400;
		
		score = new Score();
		score.restart_M(GameCanvas.game.score.bestScore);
		
		imageS.addChild(img);
		this.addChild(imageS);
        this.addChild(titleBox);
		this.addChild(spriteBox);
		this.addChild(score);
		
		this.addChild(intro);
		
		this.width = 800;
		this.height = 500;
		this.graphics.beginFill(0x000000, 1.0);
		this.graphics.drawRect(0, 0,800,480);
		
		spriteBox.addEventListener(MouseEvent.MOUSE_DOWN, play);
		spriteBox.addEventListener(MouseEvent.MOUSE_OVER, rollIn);
		spriteBox.addEventListener(MouseEvent.MOUSE_OUT, rollOut);
		
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, menAct);
		
	}
	
	function rollIn(e)
	{
		roll = true;
	}
	function rollOut(e)
	{
		roll = false;
	}
	
	function menAct(e)
	{
		if (roll == true)
		{
			spin += 1+(spin*0.001);
			//spin = spin % 360;
		}
		if (roll == false)
		{
			spin = spin * 0.95;
		}
		sint = Std.int(spin);
		imageS.rotation=sint;
	}
	
	public function act()
	{
		score.restart_M(GameCanvas.game.score.bestScore);
	}
	
	function play(e)
	{
		Main.Bmain.play();
	}
}

