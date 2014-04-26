package combat 
{
	import flash.display.Bitmap;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends BaseCharacter 
	{
		private var mEnemeyAsset:Enemy1Asset;
		
		
		public function Enemy() 
		{
			super();
			Name = "Enemy";
			
			mEnemeyAsset = new Enemy1Asset();
			
			mCharacterStat.AddStat(new Stat(2, 0, EStat.XP_VALUE));
			
			mView.x = OffsetValues.COMBAT_VIEW_WIDTH - 300;
			mView.y = OffsetValues.STAGE_HEIGHT - 400;
		}
		
		override public function SetState(aState:int):Boolean 
		{
			if (super.SetState(aState))
			{
				mView.addChild(Enemy1Asset.AssetDictionary[mCurrentSkill.SkillState.Visual]);
				return(true);
			}
			
			return(false)
		}
		
	}

}