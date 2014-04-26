package combat.skill 
{
	import combat.ESkill;
	import combat.EState;
	import combat.PlayerAsset;
	import combat.Skill;
	import combat.Stat;
	import combat.State;
	/**
	 * ...
	 * @author 
	 */
	public class DeadSkill extends Skill
	{
		private var mRespawnRate:Stat;
		
		public function DeadSkill() 
		{
			super(ESkill.DEAD);
			
			mStateList.length = 0;
			mStateList.push(new State(EState.DEAD, PlayerAsset.DEATH));
			mState = mStateList[0];
		}
		
		override public function SetStat(aStatList:Vector.<Stat>):void 
		{
			super.SetStat(aStatList);
			
			mDuration = ESkill.DEAD.Duration - (ESkill.DEAD.Duration * aStatList[0].Value);
		}
		
		override protected function Completed():void 
		{
			mStatList[1].Value = mStatList[1].OriginalValue;
			
			super.Completed();
		}
		
		override public function Update():void 
		{
			super.Update();
		}
	}

}