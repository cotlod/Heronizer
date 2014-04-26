package combat 
{
	import combat.event.CharacterEvent;
	import flash.display.Bitmap;
	import util.GameTime;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Player extends BaseCharacter 
	{
		private var mSkillTimer:Number = 0;
		private var mPlayerAsset:PlayerAsset;
		
		public function Player() 
		{
			super();
			
			mPlayerAsset = new PlayerAsset();
			
			mCharacterStat.AddStat(new Stat(1, 0, EStat.XP_MODIFIER));
			
			Name = "Player";
			
			mView.y = OffsetValues.STAGE_HEIGHT - 300;
			//mView.width = 100;
			
			mSkillList.length = 0;
			mSkillList.push(ESkill.DEFAULT_SKILL);
			mSkillList.push(ESkill.TOAST);
			mSkillList.push(ESkill.WARP);
			
			mView.y = OffsetValues.STAGE_HEIGHT - 300;
		}
		
		override public function SetState(aState:int):Boolean 
		{
			if (super.SetState(aState))
			{
				var visual:Bitmap = PlayerAsset.AssetDictionary[mCurrentSkill.SkillState.Visual];
				mView.addChild(visual);
				return(true);
			}
			
			return(false);
		}
		
		override public function Update():void 
		{
			super.Update();
		}


	}

}