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
			
			mSkillList.push(ESkill.ATTACK);
		}
		
		override public function SetState(aState:int):Boolean 
		{
			if (super.SetState(aState))
			{
				var visual:Bitmap = Enemy1Asset.AssetDictionary[mCurrentSkill.SkillState.Visual];
				mView.addChild(visual);
				return(true);
			}
			
			return(false);
		}
		
	}

}