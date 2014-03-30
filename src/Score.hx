package;

import flash.display.Sprite;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFormat;
import openfl.Assets;

/**
 * ...
 * @author Johnnyappseed
 */
class Score extends Sprite
{
	var score:Int;
	var wordBox:TextField;
	var ts:TextFormat;
	public var bestScore:Int;
	
	public function new() 
	{
		super();
		score = 0;
		ts = new TextFormat();
        ts.font = "Times New Roman";
        ts.size = 35;               
        ts.color=0xFFFFFF;
        wordBox = new TextField();
        wordBox.text = "Score: " + Std.string(bestScore);
        wordBox.setTextFormat(ts);
        this.addChild(wordBox);
		wordBox.width=400;
	}
	
	public function refresh(happened:Int)
	{
		score = score + happened;
		wordBox.text = Std.string(score);
		wordBox.setTextFormat(ts);
		if (score > bestScore)
		{
			bestScore = score;
		}
	}
	
	public function restart_M(num:Int)
	{
		wordBox.text = "Best Score: " + Std.string(num);
		wordBox.setTextFormat(ts);
	}
	
	public function restart_s(num:Int)
	{
		wordBox.text = "Score: " + Std.string(num);
		wordBox.setTextFormat(ts);
	}
	
}