package combat.ui 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class ProgressBar extends Sprite
	{
		private var mRatio:Number = 1;
		private var mBackground:Sprite;
		private var mForeground:Sprite;
		
		public function ProgressBar() 
		{
			mBackground = new Sprite();
			mBackground.graphics.beginFill(0xFF0000);
			mBackground.graphics.drawRect(0, 0, 75, 30);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x0000FF);
			mForeground.graphics.drawRect(0, 0, 75, 30);
			mForeground.graphics.endFill();
			addChild(mForeground);
		}
		
		public function SetRatio(aRatio:Number):void
		{
			mRatio = aRatio;
			mForeground.width = 75 * aRatio;
		}
	}

}