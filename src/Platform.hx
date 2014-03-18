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
		if (part == 1)
		{
			this.graphics.drawRoundRect( 0, 0, Hx - (Hw), 10, 4);
		}
		if (part == 2)
		{
			this.graphics.drawRoundRect( -10, -50, 10, 50, 10, 4);
		}
		if (part == 3)
		{
			this.graphics.drawRoundRect( Hx+(Hw), 0, 800-(Hx+Hw), 10, 4);
		}
		if (part == 4)
		{
			this.graphics.drawRoundRect( 800, -50, 10, 50, 10, 4);
		}
		this.x = 0;
		this.y = y;
	}
	
	public function refresh(y:Float)
	{
		if (y - this.y > 500)
		{
			GameCanvas.game.platforms.remove(this);
			GameCanvas.game.removeChild(this);
		}
	}
	
}