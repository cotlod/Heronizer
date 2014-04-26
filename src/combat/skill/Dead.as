package combat.skill 
{
	import combat.Skill;
	import combat.Stat;
	/**
	 * ...
	 * @author 
	 */
	public class Dead extends Skill
	{
		private var mRespawnRate:Stat;
		
		public function Dead(aRespawnRate:Stat) 
		{
			mRespawnRate = aRespawnRate;
		}
		
		override public function Update():void 
		{
			super.Update();
		}
	}

}