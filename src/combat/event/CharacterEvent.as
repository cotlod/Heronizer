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
		public static const CHANGED_SKILL:String = "Character_ChangedSkill";
		public static const SKILL_COOLDOWN_UPDATE:String = "Character_Cooldown_Update";
		
		public var Ratio:Number = 1;
		public function CharacterEvent(type:String, aRatio:Number = 1, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			Ratio = aRatio;
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event 
		{ 
			return new CharacterEvent(type, Ratio, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("CharacterEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}