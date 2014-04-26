package 
{
	import combat.CombatController;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import skill.SkillTreeController;
	import util.GameTime;
	import util.Stage2D;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var mCombatController:CombatController;
		private var mSkillTreeController:SkillTreeController;
		private var mLastFrameTime:int = 0;
		public function Main():void 
		{
			mLastFrameTime = getTimer();
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
			
			addChild(mCombatController.View);
			
			mSkillTreeController.View.x = mCombatController.View.x + 400;
			addChild(mSkillTreeController.View);
			
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function Update(e:Event):void 
		{
			var currentTime:int = getTimer();
			GameTime.DeltaTime = (currentTime - mLastFrameTime) / 1000;
			mLastFrameTime = currentTime;
			mCombatController.Update();
			mSkillTreeController.Update();
		}
	}
}