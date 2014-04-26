package skill 
{
	import combat.Skill;
	import combat.Stat;
	/**
	 * ...
	 * @author ...
	 */
	public class SkillUpdate 
	{
		private var mSkillList:Vector.<Skill>;
		private var mStatList:Vector.<Stat>;
		
		public function SkillUpdate() 
		{
			mSkillList = new Vector.<Skill>();
			mStatList = new Vector.<Stat>();
		}
		
		public function get StatList():Vector.<Stat> { return(mStatList); }
		public function get SkillList():Vector.<Skill> { return(mSkillList); }
		
	}

}