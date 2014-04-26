package combat.skill 
{
	import combat.ESkill;
	import combat.EStat;
	import combat.EState;
	import combat.ETarget;
	import combat.PlayerAsset;
	import combat.Skill;
	import combat.skill.event.SkillEvent;
	import combat.Stat;
	import combat.State;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class DeathDealerSkill extends Skill
	{
		private static const TIME_IN_ATTACK_HIT_STATE:Number = 0.5;
		
		public function DeathDealerSkill() 
		{
			super(ESkill.DEATH_DEALER);
			
			mStateList.length = 0;
			
			mStateList.push(new State(EState.IDLE, PlayerAsset.DEATH_DEALER_IDLE));
			
			mState = mStateList[0];
		}
		
		override protected function Completed():void 
		{
			dispatchEvent(new SkillEvent(SkillEvent.STAT_MODIFIER, EStat.HEALTH, -int.MAX_VALUE, ETarget.OTHER));
			
			super.Completed();
		}
	}
}