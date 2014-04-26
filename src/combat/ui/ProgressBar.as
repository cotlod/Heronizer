package combat.ui 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class ProgressBar extends Sprite
	{
		protected var mWidth:Number = 75;
		protected var mRatio:Number = 1;
		protected var mBackground:Bitmap;
		protected var mForeground:Bitmap;
		
		public function ProgressBar() 
		{
			/*mBackground = new Sprite();
			mBackground.graphics.beginFill(0xFF0000);
			mBackground.graphics.drawRect(0, 0, mWidth, 30);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x0000FF);
			mForeground.graphics.drawRect(0, 0, mWidth, 30);
			mForeground.graphics.endFill();
			addChild(mForeground);*/
		}
		
		public function SetRatio(aRatio:Number):void
		{
			mRatio = aRatio;
			mForeground.scaleX = Math.max(0, aRatio);
		}
	}

}