package skill.event 
{
	import flash.events.Event;
	
	public class SkillTreeEvent extends Event
	{
		static public var SKILL_CHANGED:String = "skill.event.SkillTreeEvent::SKILL_CHANGED";
		
		public function SkillTreeEvent(aType:String) 
		{
			super(aType);
		}
		
	}

}