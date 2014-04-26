package combat 
{
	import mvc.BaseController;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class BaseCharacter extends BaseController
	{
		protected var Name:String = "";
		public var Health:Stat = new Stat(10, 0, EStat.HEALTH);
		public var Speed:Stat = new Stat(10, 0, EStat.SPEED);
		public var Attack:Stat = new Stat(1, 0, EStat.ATTACK);
		public var Defense:Stat = new Stat(1, 0, EStat.DEFENSE);
		public var SkillCooldown:Stat = new Stat(20, 0, EStat.SKILL_COOLDOWN);
		
		private var mAttackTimer:Number = 0;
		
		public function BaseCharacter() 
		{
			mView = new CharacterView();
		}
		
		public function SendDamage(aDamage:int):void
		{
			var finalDamage:int = aDamage / Defense.Value;
			trace(Name + " received " + finalDamage + " to the face.");
			Health.Value -= finalDamage;
			if (Health.Value <= 0)
			{
				trace(Name + " is DEAD.");
			}
		}
		
		override public function Update():void
		{
			mAttackTimer += GameTime.DeltaTime;
			if (mAttackTimer >= Speed.Value)
			{
				trace("ATTACK");
				mAttackTimer = mAttackTimer - Speed.Value;
			}
		}
	}

}