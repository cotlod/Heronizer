package combat.ui 
{
	import flash.display.Sprite;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class XPBar extends ProgressBar 
	{
		
		public function XPBar() 
		{
			mRatio = 0;
			mWidth = OffsetValues.COMBAT_VIEW_WIDTH / 2;
			mBackground = new Sprite();
			mBackground.graphics.beginFill(0xB200FF);
			mBackground.graphics.drawRect(0, 0, mWidth, 20);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x57007F);
			mForeground.graphics.drawRect(0, 0, mWidth, 20);
			mForeground.graphics.endFill();
			addChild(mForeground);
		}
		
	}

}