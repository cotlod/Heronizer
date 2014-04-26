package combat 
{
	/**
	 * ...
	 * @author ...
	 */
	public class ESkill 
	{
		static private var mESkillList:Vector.<ESkill> = new Vector.<ESkill>()
		
		static public var SKILL_ONE:ESkill = new ESkill("SkillOne", SkillOne)
		
		public var Name:String;
		public var Definition:Class;
		
		public function ESkill(aName:String, aDefinition:Class) 
		{
			Name = aName;
			Definition = aDefinition;
			
			mESkillList.push(this);
		}
		
		static public function GetList():Vector.<ESkill> { return(mESkillList); }
	}
}