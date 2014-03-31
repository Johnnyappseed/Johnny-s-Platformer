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
		this.type = type;
		if (type == 0)
		{
			image = new Bitmap(Assets.getBitmapData("img/bomb.png"));
		}
		if (type == 1)
		{
			image = new Bitmap(Assets.getBitmapData("img/lightning.png"));
		}
		image.y = -image.y / 2;
		image.x = -image.x / 2;
		image.height = 60;
		image.width = 60;
		this.addChild(image);
		//this.y = 100;
	}
	
	public function act()
	{
		this.y += 2;
	}
	
}