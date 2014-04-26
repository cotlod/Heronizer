package combat.ui 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class HealthBar extends ProgressBar 
	{
		public function HealthBar() 
		{
			mWidth = 75;
			mBackground = new Sprite();
			mBackground.graphics.beginFill(0xFF0000);
			mBackground.graphics.drawRect(0, 0, mWidth, 30);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x0000FF);
			mForeground.graphics.drawRect(0, 0, mWidth, 30);
			mForeground.graphics.endFill();
			addChild(mForeground);
		}
	}
}