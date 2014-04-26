package combat.skill.event 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author 
	 */
	public class SkillEvent extends Event
	{
		static public var STARTED:String = "combat.skill.event.SkillEvent::STARTED";
		static public var DONE:String = "combat.skill.event.SkillEvent::DONE";
		
		public function SkillEvent(aType:String) 
		{
			super(aType);
		}
	}
}