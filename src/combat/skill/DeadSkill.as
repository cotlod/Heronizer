package combat.skill 
{
	import combat.ESkill;
	import combat.EState;
	import combat.Skill;
	import combat.Stat;
	/**
	 * ...
	 * @author 
	 */
	public class DeadSkill extends Skill
	{
		private var mRespawnRate:Stat;
		private var mState:EState;
		
		public function DeadSkill() 
		{
			super(ESkill.DEAD);
			
			//mState = EState.DEAD;
		}
		
		override public function SetStat(aStatList:Vector.<Stat>):void 
		{
			super.SetStat(aStatList);
			
			mDuration = ESkill.DEAD.Duration - (ESkill.DEAD.Duration * aStatList[0].Value);
		}
		
		public function get State():EState { return(mState); }
		
		override public function Update():void 
		{
			super.Update();
		}
	}

}