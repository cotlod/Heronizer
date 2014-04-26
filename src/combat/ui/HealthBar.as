package combat.ui 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class HealthBar extends ProgressBar 
	{
		[Embed(source="../../../bin/assets/UI_HealthBar_Background.png")]
		private var mBackGroundClass:Class;
		[Embed(source="../../../bin/assets/UI_HealthBar_Foreground.png")]
		private var mForeGroundClass:Class;
		public function HealthBar() 
		{
			/*mWidth = 75;
			mBackground = new Sprite();
			mBackground.graphics.beginFill(0xFF0000);
			mBackground.graphics.drawRect(0, 0, mWidth, 30);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x0000FF);
			mForeground.graphics.drawRect(0, 0, mWidth, 30);
			mForeground.graphics.endFill();
			addChild(mForeground);*/
			mBackground = new mBackGroundClass();
			mForeground = new mForeGroundClass();
			addChild(mBackground);
			addChild(mForeground);
			mForeground.x = 17;
			mForeground.y = 12;
		}
	}
}