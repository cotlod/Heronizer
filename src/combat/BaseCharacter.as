package combat 
{
	import combat.event.CharacterEvent;
	import mvc.BaseController;
	import util.GameTime;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class BaseCharacter extends BaseController
	{
		protected var Name:String = "";
		public var Health:Stat = new Stat(10, 0, EStat.HEALTH);
		public var Speed:Stat = new Stat(5, 0, EStat.SPEED);
		public var Attack:Stat = new Stat(1, 0, EStat.ATTACK);
		public var Defense:Stat = new Stat(1, 0, EStat.DEFENSE);
		public var SkillDuration:Stat = new Stat(20, 0, EStat.SKILL_DURATION);
		public var XpModifier:Stat = new Stat(1, 0, EStat.XP_MODIFIER);
		
		private var mAttackTimer:Number = 0;
		
		public function BaseCharacter() 
		{
			mView = new CharacterView();
			mView.y = OffsetValues.CHARACTERS_Y_OFFSET;
		}
		
		public function SendDamage(aDamage:int):void
		{
			var finalDamage:int = aDamage / Defense.Value;
			trace(Name + " received " + finalDamage + " to the face.");
			Health.Value -= finalDamage;
			dispatchEvent(new CharacterEvent(CharacterEvent.RECEIVED_DAMAGE));
			if (Health.Value <= 0)
			{
				trace(Name + " is DEAD.");
				dispatchEvent(new CharacterEvent(CharacterEvent.DIED));
			}
		}
		
		override public function Update():void
		{
			mAttackTimer += GameTime.DeltaTime;
			if (mAttackTimer >= Speed.Value)
			{
				trace("ATTACK");
				dispatchEvent(new CharacterEvent(CharacterEvent.ATTACK));
				mAttackTimer = mAttackTimer - Speed.Value;
			}
		}
	}

}