package combat.skill 
{
	import combat.ESkill;
	import combat.Skill;
	import combat.skill.event.SkillEvent;
	
	/**
	 * ...
	 * @author 
	 */
	public class WarpSkill extends Skill 
	{
		
		public function WarpSkill() 
		{
			super(ESkill.WARP);
		}
		
		override public function Start():void 
		{
			super.Start();
			dispatchEvent(new SkillEvent(SkillEvent.CHANGE_BACKGROUND));
		}
	}
}