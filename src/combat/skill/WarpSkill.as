package combat.skill 
{
	import combat.ESkill;
	import combat.EState;
	import combat.PlayerAsset;
	import combat.Skill;
	import combat.skill.event.SkillEvent;
	import combat.State;
	
	/**
	 * ...
	 * @author 
	 */
	public class WarpSkill extends Skill 
	{
		
		public function WarpSkill() 
		{
			super(ESkill.WARP);
			mStateList.push(new State(EState.HIT, PlayerAsset.HIT));
		}
		
		override public function Start():void 
		{
			super.Start();
			dispatchEvent(new SkillEvent(SkillEvent.CHANGE_BACKGROUND));
		}
	}
}