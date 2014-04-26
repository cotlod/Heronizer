package combat.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class CharacterEvent extends Event 
	{
		public static const ATTACK:String = "Character_Attack";
		public static const RECEIVED_DAMAGE:String = "Character_Received_Damage";
		public static const DIED:String = "Character_Died";
		public static const XP_UPDATED:String = "Character_Updated";
		public static const CHANGED_SKILL:String = "Character_ChangedSkill";
		
		public function CharacterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new CharacterEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("CharacterEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}