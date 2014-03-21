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
	
	public function new() 
	{
		super();
		score = 0;
		ts = new TextFormat();
        ts.font = "Times New Roman";
        ts.size = 35;               
        ts.color=0xFFFFFF;
        wordBox = new TextField();
        wordBox.text = "Score: " + Std.string(score);
        wordBox.setTextFormat(ts);
        this.addChild(wordBox);
		wordBox.width=400;
	}
	
	public function scoreRefresh(happened:Int)
	{
		score = score + happened;
		wordBox.text = "Score: " + Std.string(score);
		wordBox.setTextFormat(ts);
	}
	
	public function restart()
	{
		wordBox.text = "Score: " + Std.string(0);
		wordBox.setTextFormat(ts);
	}
	
}