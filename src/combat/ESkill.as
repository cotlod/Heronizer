package combat 
{
	import combat.skill.DeadSkill;
	import combat.skill.DefaultSkill;
	import combat.skill.ToastSkill;
	/**
	 * ...
	 * @author ...
	 */
	public class ESkill 
	{
		static private var mESkillList:Vector.<ESkill> = new Vector.<ESkill>()
		
		static public var DEFAULT_SKILL:ESkill = new ESkill(0, "DefaultSkill", DefaultSkill, 5, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE)
		static public var DEAD:ESkill = new ESkill(1, "Dead", DeadSkill, 4, EStat.RESPAWN_RATE, EStat.HEALTH);
		static public var TOAST:ESkill = new ESkill(2, "Toast", ToastSkill, 10, EStat.ATTACK, EStat.SPEED, EStat.SKILL_DURATION, EStat.CRIT_CHANCE, EStat.XP_MODIFIER);
		
		public var ID:int;
		public var Name:String;
		public var Definition:Class;
		public var Duration:Number;
		public var StatList:Vector.<EStat>;
		
		public function ESkill(aID:int, aName:String, aDefinition:Class, aDuration:Number, ...statList) 
		{
			ID = aID;
			Name = aName;
			Definition = aDefinition;
			Duration = aDuration;
			StatList = new Vector.<EStat>();
			
			for each(var stat:EStat in statList)
			{
				StatList.push(stat);
			}
			
			mESkillList.push(this);
		}
		
		static public function GetList():Vector.<ESkill> { return(mESkillList); }
		
		static public function GetSkillByID(aID:int):ESkill 
		{
			for (var i:int = 0; i < mESkillList.length; i++) 
			{
				if (mESkillList[i].ID == aID)
				{
					return(mESkillList[i]);
				}
			}
			
			return(null);
		}
	}
}