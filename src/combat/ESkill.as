package combat 
{
	import combat.skill.AttackSkill;
	import combat.skill.DeadSkill;
	import combat.skill.DeathDealerSkill;
	import combat.skill.DefaultSkill;
	import combat.skill.FireSkill;
	import combat.skill.HealerSkill;
	import combat.skill.MegaDickSkill;
	import combat.skill.MidgetSkill;
	import combat.skill.PincerSkill;
	import combat.skill.RoidUpSkill;
	import combat.skill.ToastSkill;
	import combat.skill.WarpSkill;

	/**
	 * ...
	 * @author ...
	 */
	public class ESkill 
	{
		static private var mESkillList:Vector.<ESkill> = new Vector.<ESkill>()
		
		static public var DEFAULT_SKILL:ESkill = new ESkill(0, "DefaultSkill", DefaultSkill, 2)
		static public var ATTACK:ESkill = new ESkill(1, "Attack", AttackSkill, 5, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE)
		static public var DEAD:ESkill = new ESkill(2, "Dead", DeadSkill, 2, EStat.RESPAWN_RATE, EStat.HEALTH);
		static public var TOAST:ESkill = new ESkill(3, "Toast", ToastSkill, 10, EStat.ATTACK, EStat.SPEED, EStat.SKILL_DURATION, EStat.CRIT_CHANCE, EStat.XP_MODIFIER);
		static public var WARP:ESkill = new ESkill(4, "Warp", WarpSkill, 2);
		static public var PINCER:ESkill = new ESkill(5, "Pincer", PincerSkill, 15, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE);
		static public var FIRE:ESkill = new ESkill(6, "Fire", FireSkill, 10, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE);
		static public var DEATH_DEALER:ESkill = new ESkill(7, "DeathDealer", DeathDealerSkill, 10);
		static public var MEGA_DICK:ESkill = new ESkill(8, "MegaDick", MegaDickSkill, 20, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE);
		static public var ROID_UP:ESkill = new ESkill(9, "RoidUp", RoidUpSkill, 5, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE);
		static public var MIDGET:ESkill = new ESkill(10, "Midget", MidgetSkill, 5, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE);
		static public var HEALER:ESkill = new ESkill(11, "Healer", HealerSkill, 10, EStat.SPEED, EStat.ATTACK, EStat.CRIT_CHANCE);
		
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