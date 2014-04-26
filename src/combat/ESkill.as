package combat 
{
	/**
	 * ...
	 * @author ...
	 */
	public class ESkill 
	{
		static private var mESkillList:Vector.<ESkill> = new Vector.<ESkill>()
		
		static public var DEFAULT_SKILL:ESkill = new ESkill(0, "DefaultSkill", DefaultSkill, 10)
		static public var SKILL_ONE:ESkill = new ESkill(1, "SkillOne", SkillOne, 10)
		
		public var ID:int;
		public var Name:String;
		public var Definition:Class;
		public var Duration:Number;
		
		public function ESkill(aID:int, aName:String, aDefinition:Class, aDuration:Number) 
		{
			ID = aID;
			Name = aName;
			Definition = aDefinition;
			Duration = aDuration;
			
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