package combat.ui 
{
	import flash.display.Sprite;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class SkillCountdown extends ProgressBar 
	{
		
		public function SkillCountdown() 
		{
			mRatio = 0;
			mWidth = OffsetValues.COMBAT_VIEW_WIDTH / 2;
			mBackground = new Sprite();
			mBackground.graphics.beginFill(0x0094FF);
			mBackground.graphics.drawRect(0, 0, mWidth, 20);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x00FFFF);
			mForeground.graphics.drawRect(0, 0, mWidth, 20);
			mForeground.graphics.endFill();
			addChild(mForeground);
		}
		
	}

}