package combat 
{
	import combat.event.CharacterEvent;
	import combat.skill.DeadSkill;
	import combat.skill.DefaultSkill;
	import combat.skill.event.SkillEvent;
	import flash.events.Event;
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
		public var RespawnRate:Stat = new Stat(0, 0, EStat.RESPAWN_RATE);
		
		public var mStatList:Vector.<Stat> = new Vector.<Stat>();
		public var mSkillList:Vector.<ESkill> = new Vector.<ESkill>();
		private var mAttackTimer:Number = 0;
		private var mAttackHitTimer:Number = 0;
		private var mCurrentState:int = EState.IDLE;
		
		protected var mCurrentSkill:Skill;
		
		public function BaseCharacter() 
		{
			mView = new CharacterView();
			mView.y = OffsetValues.CHARACTERS_Y_OFFSET;
			
			mStatList.push(Health);
			mStatList.push(Speed);
			mStatList.push(Attack);
			mStatList.push(Defense);
			mStatList.push(CriticalChance);
			
			SetSkill(new DefaultSkill());
			
			mSkillList.push(ESkill.DEFAULT_SKILL);
		}
		
		public function SetSkill(aSkill:Skill):void 
		{
			mCurrentSkill = aSkill;
			mCurrentSkill.addEventListener(SkillEvent.STARTED, OnSkillStarted);
			mCurrentSkill.addEventListener(SkillEvent.DONE, OnSkillDone);
			mCurrentSkill.Start();
		}
		
		private function OnSkillStarted(aEvent:Event):void 
		{
			
		}
		
		private function OnSkillDone(aEvent:Event):void 
		{
			if (Health.Value <= 0)
			{
				SetSkill(new DeadSkill());
			}
			else
			{
				var randomSkill:ESkill = mSkillList[int(Math.random() * mSkillList.length)];
				
				var skill:Skill = new randomSkill.Definition();
				
				var characterStatList:Vector.<Stat> = new  Vector.<Stat>();
				
				for (var i:int = 0; i < randomSkill.StatList.length; i++) 
				{
					for (var j:int = 0; j < mStatList.length; j++) 
					{
						if (mStatList[j].Type.ID == randomSkill.StatList[i].ID)
						{
							characterStatList.push(mStatList[j]);
							break;
						}
					}
					
					skill.SetStat(characterStatList);
				}
				
				SetSkill(skill);
			}
		}
		
		public function ReceiveDamage(aDamage:int):void
		{
			var finalDamage:int = aDamage / Defense.Value;
			trace(Name + " received " + finalDamage + " to the face.");
			Health.Value -= finalDamage;
			dispatchEvent(new CharacterEvent(CharacterEvent.RECEIVED_DAMAGE, aDamage));
			
			if (Health.Value <= 0)
			{
				mCurrentSkill.Stop();
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
			mCurrentSkill.Update();
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