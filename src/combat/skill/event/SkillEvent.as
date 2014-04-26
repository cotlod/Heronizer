package combat.skill.event 
{
	import combat.EStat;
	import flash.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class SkillEvent extends Event
	{
		static public var STARTED:String = "combat.skill.event.SkillEvent::STARTED";
		static public var DONE:String = "combat.skill.event.SkillEvent::DONE";
		static public var STATE:String = "combat.skill.event.SkillEvent::STATE";
		static public var STAT_MODIFIER:String = "combat.skill.event.SkillEvent::STAT_MODIFIER";
		static public var CHANGE_BACKGROUND:String = "combat.skill.event.SkillEvent::CHANGE_BACKGROUND";
		
		public var StatModified:EStat;
		public var Value:Number;
		public var Target:int;
		
		public function SkillEvent(aType:String, aStatModified:EStat = null, aValue:Number = 0, aTarget:int = 0) 
		{
			StatModified = aStatModified;
			Value = aValue;
			Target = aTarget;
			super(aType);
		}
	}
}