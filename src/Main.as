package 
{
	import combat.CombatController;
	import flash.display.Sprite;
	import flash.events.Event;
	import skill.SkillTreeController;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var mCombatController:CombatController;
		private var mSkillTreeController:SkillTreeController;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			mCombatController = new CombatController();
			mSkillTreeController = new SkillTreeController();
		}
		
	}
	
}