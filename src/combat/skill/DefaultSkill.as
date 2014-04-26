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
	public class DefaultSkill extends Skill
	{		
		public function DefaultSkill() 
		{
			super(ESkill.DEFAULT_SKILL);
			
			mStateList.push(new State(EState.HIT, PlayerAsset.HIT));
		}
	}
}