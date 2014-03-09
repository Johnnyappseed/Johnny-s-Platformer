package ;

import flash.display.Sprite;

/**
 * ...
 * @author Johnnyappseed
 */
class Platform extends Sprite
{
	
	
	public function new(x,y,w,h) 
	{
		super();
		this.graphics.beginFill(0xFFCCCC);
		this.graphics.drawRoundRect( 0, 0, w, h, 4);
		this.x = 0;
		this.y = y;
	}
	
}