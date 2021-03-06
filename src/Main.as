package 
{
	import combat.CombatController;
	import combat.CombatView;
	import combat.event.CharacterEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import skill.event.SkillTreeEvent;
	import skill.SkillTreeController;
	import skill.SkillUpdate;
	import util.AudioLoop;
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
			new AudioLoop();
			// entry point
			Stage2D = stage;
			mCombatController = new CombatController();
			mCombatController.addEventListener(CharacterEvent.XP_UPDATED, OnXPChanged);
			mSkillTreeController = new SkillTreeController();
			mSkillTreeController.addEventListener(SkillTreeEvent.SKILL_CHANGED, OnSkillChanged);
			
			
			mSkillTreeController.View.x = mCombatController.View.x + 400;
			addChild(mSkillTreeController.View);
			addChild(mCombatController.View);
			
			addEventListener(Event.ENTER_FRAME, Update);
		}
		
		private function OnXPChanged(aEvent:CharacterEvent):void 
		{
			mSkillTreeController.AddXP(aEvent.Value);
			
			(mCombatController.View as CombatView).AddXP(mSkillTreeController.GetXP());
		}
		
		private function OnSkillChanged(aEvent:SkillTreeEvent):void 
		{
			var skillUpdate:SkillUpdate = mSkillTreeController.ComputeSkill();
			mCombatController.SetSkillUpdate(skillUpdate);
			(mCombatController.View as CombatView).AddXP(mSkillTreeController.GetXP());
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