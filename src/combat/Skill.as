package combat 
{
	import combat.skill.event.SkillEvent;
	import flash.events.EventDispatcher;
	import util.GameTime;
	import util.IUpdatable;
	/**
	 * ...
	 * @author 
	 */
	public class Skill extends EventDispatcher implements IUpdatable
	{
		private var mType:ESkill;
		private var mElapsed:Number = 0
		private var mStarted:Boolean;
		private var mCompleted:Boolean;
		protected var mState:int = EState.IDLE;
		protected var mDuration:Number = 0;
		
		public function Skill(aType:ESkill) 
		{
			mType = aType;
			mDuration = aType.Duration;
		}
		
		public function SetStat(aStatList:Vector.<Stat>):void
		{
			
		}
		
		public function Start():void 
		{
			mStarted = true;
			
			dispatchEvent(new SkillEvent(SkillEvent.STARTED));
		}
		
		public function Stop():void 
		{
			mStarted = false;
			//dispatchEvent(new SkillEvent(SkillEvent.DONE));
		}
		
		public function get Type():ESkill { return(mType); }
		
		public function Update():void 
		{
			if (!mStarted) { return; }
			
			mElapsed += GameTime.DeltaTime;
			
			if (!mCompleted && mElapsed >= mDuration)
			{
				mCompleted = true;
				dispatchEvent(new SkillEvent(SkillEvent.DONE));
			}
		}
		
		public function get State():int { return(mState); }
	}
}