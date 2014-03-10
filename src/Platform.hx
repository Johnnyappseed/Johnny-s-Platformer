package ;

import flash.display.Sprite;

/**
 * ...
 * @author Johnnyappseed
 */
class Platform extends Sprite
{
	
	
	public function new(y,Hx,Hw,part) 
	{
		super();
		this.graphics.beginFill(0xFFCCCC);
		Hw = Std.int(Hw / 2);
		trace(Hw);
		if (part == 1)
		{
			this.graphics.drawRoundRect( 0, 0, Hx-(Hw), 10, 4);
		}
		else
		{
			this.graphics.drawRoundRect( Hx+(Hw), 0, Hx+(Hw), 10, 4);
		}
		this.x = 0;
		this.y = y;
	}
	
}