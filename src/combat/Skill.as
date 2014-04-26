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
		
		protected var mState:State;
		
		protected var mStatList:Vector.<Stat>;
		protected var mStateList:Vector.<State>;
		
		protected var mDuration:Number = 0;
		
		public function Skill(aType:ESkill) 
		{
			mType = aType;
			mDuration = aType.Duration;
			
			mStateList = new Vector.<State>();
			mStateList.push(new State(EState.IDLE, PlayerAsset.IDLE));
			mState = mStateList[0];
		}
		
		public function SetStat(aStatList:Vector.<Stat>):void
		{
			mStatList = aStatList;
		}
		
		public function Start():void 
		{
			mStarted = true;
			
			dispatchEvent(new SkillEvent(SkillEvent.STARTED));
		}
		
		public function Stop():void 
		{
			mStarted = false;
		}
		
		protected function Completed():void 
		{
			mCompleted = true;
			dispatchEvent(new SkillEvent(SkillEvent.DONE));
		}
		
		public function get Type():ESkill { return(mType); }
		public function get SkillState():State { return(mState); }
		public function get Elapsed():Number { return(mElapsed); }
		public function get Duration():Number { return(mDuration); }
		
		public function get StateList():Vector.<State> { return(mStateList); }
		
		public function Update():void 
		{
			if (!mStarted) { return; }
			
			mElapsed += GameTime.DeltaTime;
			
			if (!mCompleted && mElapsed >= mDuration)
			{
				Completed();
			}
		}
	}
}