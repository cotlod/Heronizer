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
		protected var Name:String = "";
		public var Health:Stat = new Stat(10, 0, EStat.HEALTH);
		public var Speed:Stat = new Stat(1, 0, EStat.SPEED);
		public var Attack:Stat = new Stat(1, 0, EStat.ATTACK);
		public var Defense:Stat = new Stat(1, 0, EStat.DEFENSE);
		public var CriticalChance:Stat = new Stat(10, 0, EStat.CRIT_CHANCE);
		public var RespawnRate:Stat = new Stat(0, 0, EStat.RESPAWN_RATE);
		
		public var mStatList:Vector.<Stat> = new Vector.<Stat>();
		public var mSkillList:Vector.<ESkill> = new Vector.<ESkill>();
		
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
			mStatList.push(RespawnRate);
			
			mSkillList.push(ESkill.DEFAULT_SKILL);
		}
		
		private function OnSkillStatModifier(e:SkillEvent):void 
		{
			e = new SkillEvent(e.type, e.StatModified, e.Value, e.Target);
			dispatchEvent(e);
		}
		
		public function Init():void
		{
			SetSkill(new DefaultSkill());
		}
		
		public function SetSkill(aSkill:Skill):void 
		{
			if (mCurrentSkill)
			{
				mCurrentSkill.removeEventListener(SkillEvent.STARTED, OnSkillStarted);
				mCurrentSkill.removeEventListener(SkillEvent.DONE, OnSkillDone);
				mCurrentSkill.removeEventListener(SkillEvent.STAT_MODIFIER, OnSkillStatModifier);
				mCurrentSkill.Stop();
			}
			
			mCurrentSkill = aSkill;
			mCurrentSkill.addEventListener(SkillEvent.STARTED, OnSkillStarted);
			mCurrentSkill.addEventListener(SkillEvent.DONE, OnSkillDone);
			mCurrentSkill.addEventListener(SkillEvent.STAT_MODIFIER, OnSkillStatModifier);
			
			if (mCurrentSkill.Type.StatList)
			{
				var characterStatList:Vector.<Stat> = new  Vector.<Stat>();
				
				for (var i:int = 0; i < mCurrentSkill.Type.StatList.length; i++) 
				{
					for (var j:int = 0; j < mStatList.length; j++) 
					{
						if (mStatList[j].Type.ID == mCurrentSkill.Type.StatList[i].ID)
						{
							characterStatList.push(mStatList[j]);
							break;
						}
					}
				}
				
				mCurrentSkill.SetStat(characterStatList);
			}
			
			mCurrentSkill.Start();
		}
		
		private function OnSkillStarted(aEvent:Event):void 
		{
			SetState(mCurrentSkill.State);
		}
		
		private function OnSkillDone(aEvent:Event):void 
		{
			var randomSkill:ESkill = mSkillList[int(Math.random() * mSkillList.length)];
			
			var skill:Skill = new randomSkill.Definition();
			
			SetSkill(skill);
		}
		
		public function ReceiveDamage(aDamage:int):void
		{
			if (mCurrentState == EState.DEAD) { return; }
			
			var finalDamage:int = aDamage / Defense.Value;
			trace(Name + " received " + finalDamage + " to the face.");
			Health.Value -= finalDamage;
			dispatchEvent(new CharacterEvent(CharacterEvent.RECEIVED_DAMAGE, aDamage));
			
			if (Health.Value <= 0)
			{
				SetSkill(new DeadSkill());
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
			
			if (mCurrentState != EState.DEAD && (mCurrentState == EState.ATTACK || mCurrentState == EState.HIT))
			{
				//mAttackHitTimer = 0;
			}
		}
				
		public function get CurrentSkill():Skill 
		{
			return(mCurrentSkill);
		}
		
		override public function Update():void
		{
			mCurrentSkill.Update();
		}
	}

}