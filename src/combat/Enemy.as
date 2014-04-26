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
		private var mEnemey1Asset:Enemy1Asset;
		private var mEnemey2Asset:Enemy2Asset;
		private var mRandomAsset:Number;
		
		
		public function Enemy() 
		{
			super();
			Name = "Enemy";
			
			mEnemey1Asset = new Enemy1Asset();
			mEnemey2Asset = new Enemy2Asset();
			
			mCharacterStat.AddStat(new Stat(2, 0, EStat.XP_VALUE));
			
			mView.x = OffsetValues.COMBAT_VIEW_WIDTH - 300;
			mView.y = OffsetValues.STAGE_HEIGHT - 400;
			
			mSkillList.push(ESkill.ATTACK);
		}
		
		override public function SetState(aState:int):Boolean 
		{
			if (super.SetState(aState))
			{
				
				var visual:Bitmap;
				if (mRandomAsset < 0.5)
				{
					visual = Enemy1Asset.AssetDictionary[mCurrentSkill.SkillState.Visual];
				}
				else 
				{
					visual = Enemy2Asset.AssetDictionary[mCurrentSkill.SkillState.Visual];
				}
				/*else
				{
					visual = Enemy3Asset.AssetDictionary[mCurrentSkill.SkillState.Visual];
				}*/
				mView.addChild(visual);
				return(true);
			}
			
			return(false);
		}
		
		public function SetRandomAsset(aRandomAsset:Number):void 
		{
			mRandomAsset = aRandomAsset
		}
	}
}