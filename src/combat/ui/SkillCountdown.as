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
		[Embed(source="../../../bin/assets/UI_SkillBar_Background.png")]
		private var mBackGroundClass:Class;
		[Embed(source="../../../bin/assets/UI_SkillBar_Foreground.png")]
		private var mForeGroundClass:Class;
		public function SkillCountdown() 
		{
			mRatio = 0;
			/*mWidth = OffsetValues.COMBAT_VIEW_WIDTH / 2;
			mBackground = new Sprite();
			mBackground.graphics.beginFill(0x0094FF);
			mBackground.graphics.drawRect(0, 0, mWidth, 20);
			mBackground.graphics.endFill();
			addChild(mBackground);
			mForeground = new Sprite();
			mForeground.graphics.beginFill(0x00FFFF);
			mForeground.graphics.drawRect(0, 0, mWidth, 20);
			mForeground.graphics.endFill();
			addChild(mForeground);*/
			mBackground = new mBackGroundClass();
			mForeground = new mForeGroundClass();
			addChild(mBackground);
			addChild(mForeground);
			mForeground.x = 36;
			mForeground.y = 12;
		}
		
	}

}