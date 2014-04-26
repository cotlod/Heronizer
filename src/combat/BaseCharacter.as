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
		private static const TIME_IN_ATTACK_HIT_STATE:Number = 1;
		protected var Name:String = "";
		public var Health:Stat = new Stat(10, 0, EStat.HEALTH);
		public var Speed:Stat = new Stat(5, 0, EStat.SPEED);
		public var Attack:Stat = new Stat(1, 0, EStat.ATTACK);
		public var Defense:Stat = new Stat(1, 0, EStat.DEFENSE);
		public var CriticalChance:Stat = new Stat(10, 0, EStat.CRIT_CHANCE);
		
		public var mStatList:Vector.<Stat> = new Vector.<Stat>();
		private var mAttackTimer:Number = 0;
		private var mAttackHitTimer:Number = 0;
		private var mCurrentState:int = EState.IDLE;
		protected var mCurrentSkill:ESkill;
		
		public function BaseCharacter() 
		{
			mView = new CharacterView();
			mView.y = OffsetValues.CHARACTERS_Y_OFFSET;
			mStatList.push(Health);
			mStatList.push(Speed);
			mStatList.push(Attack);
			mStatList.push(Defense);
			mStatList.push(CriticalChance);
		}
		
		public function ReceiveDamage(aDamage:int):void
		{
			var finalDamage:int = aDamage / Defense.Value;
			trace(Name + " received " + finalDamage + " to the face.");
			Health.Value -= finalDamage;
			dispatchEvent(new CharacterEvent(CharacterEvent.RECEIVED_DAMAGE, aDamage));
			if (Health.Value <= 0)
			{
				trace(Name + " is DEAD.");
				SetState(EState.DEAD);
				dispatchEvent(new CharacterEvent(CharacterEvent.DIED));
			}
			else
			{
				SetState(EState.HIT);
			}
		}
		
		public function SetState(aState:int):void
		{
			//override for visual
			mCurrentState = aState;
			if (mCurrentState == EState.ATTACK || mCurrentState == EState.HIT)
			{
				mAttackHitTimer = 0;
			}
		}
		
		override public function Update():void
		{
			mAttackTimer += GameTime.DeltaTime;
			if (mAttackTimer >= Speed.Value)
			{
				dispatchEvent(new CharacterEvent(CharacterEvent.ATTACK));
				mAttackTimer = mAttackTimer - Speed.Value;
			}
			if (mCurrentState == EState.ATTACK || mCurrentState == EState.HIT)
			{
				mAttackHitTimer += GameTime.DeltaTime;
				if (mAttackHitTimer >= TIME_IN_ATTACK_HIT_STATE)
				{
					SetState(EState.IDLE);
				}
			}
		}
	}

}