package 
{
	import combat.CombatController;
	import flash.display.Sprite;
	import flash.events.Event;
	import skill.SkillTreeController;
	import util.Stage2D;
	
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
			Stage2D = stage;
			mCombatController = new CombatController();
			mSkillTreeController = new SkillTreeController();
			
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function Update(e:Event):void 
		{
			mCombatController.Update();
			mSkillTreeController.Update();
		}
		
	}
	
}