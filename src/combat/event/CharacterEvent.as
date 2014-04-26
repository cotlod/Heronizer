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
		public static const DIED:String = "Character_Died";
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