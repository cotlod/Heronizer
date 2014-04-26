package combat 
{
	/**
	 * ...
	 * @author ...
	 */
	public class EStat 
	{
		static private var mEStatList:Vector.<EStat> = new Vector.<EStat>();
		
		static public var HEALTH:EStat = new EStat(0, "Health");
		static public var SPEED:EStat = new EStat(1, "Speed");
		static public var ATTACK:EStat = new EStat(2, "Attack");
		static public var DEFENSE:EStat = new EStat(3, "Defense");
		static public var SKILL_DURATION:EStat = new EStat(4, "SkillDuration");
		static public var CRIT_CHANCE:EStat = new EStat(5, "CritChance");
		static public var XP_MODIFIER:EStat = new EStat(6, "XpModifier");
		
		public var ID:int;
		public var Name:String;
		
		public function EStat(aID:int, aName:String) 
		{
			ID = aID;
			Name = aName;
			
			mEStatList.push(this);
		}
		
		static public function GetList():Vector.<EStat> { return(mEStatList); }
	}

}