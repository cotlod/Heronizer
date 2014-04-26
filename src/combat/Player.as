package combat 
{
	import combat.event.CharacterEvent;
	import flash.display.Bitmap;
	import flash.events.Event;
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
			
			/*mSkillList.push(ESkill.ATTACK);
			mSkillList.push(ESkill.HEALER);
			mSkillList.push(ESkill.DEATH_DEALER);
			mSkillList.push(ESkill.FIRE);
			mSkillList.push(ESkill.MEGA_DICK);
			mSkillList.push(ESkill.MIDGET);
			mSkillList.push(ESkill.PINCER);
			mSkillList.push(ESkill.ROID_UP);
			mSkillList.push(ESkill.TOAST);
			mSkillList.push(ESkill.WARP);*/
		}
		
		override protected function OnSkillDone(aEvent:Event):void 
		{
			super.OnSkillDone(aEvent);
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
		
	}

}