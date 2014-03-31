package ;

import flash.display.Sprite;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.MouseEvent;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Upgrade extends Sprite
{
	var image:Bitmap;
	public var type:Int;

	public function new(type:Int) 
	{
		super();
		var size = 60;
		this.type = type;
		if (type == 0)
		{
			image = new Bitmap(Assets.getBitmapData("img/bomb.png"));
		}
		if (type == 1)
		{
			image = new Bitmap(Assets.getBitmapData("img/lightning.png"));
		}
		image.y = -size / 2;
		image.x = -size / 2;
		image.height = size;
		image.width = size;
		this.addChild(image);
		//this.y = 100;
		this.width = size;
		this.height = size;
	}
	
	public function act()
	{
		this.y += 2;
	}
	
}