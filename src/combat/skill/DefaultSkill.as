package combat.skill 
{
	import combat.ESkill;
	import combat.EStat;
	import combat.EState;
	import combat.ETarget;
	import combat.Skill;
	import combat.skill.event.SkillEvent;
	import combat.Stat;
	import combat.State;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class DefaultSkill extends Skill
	{
		private static const TIME_IN_ATTACK_HIT_STATE:Number = 0.5;
		private var mAttackTimer:Number = 0;
		private var mAttackHitTimer:Number = 0;
		private var mSpeed:Stat;
		private var mAttack:Stat;
		private var mCritChance:Stat;
		
		public function DefaultSkill() 
		{
			super(ESkill.DEFAULT_SKILL);
			
			mStateList.push(new State(EState.ATTACK, "Strike"));
			mStateList.push(new State(EState.HIT, "Hit"));
		}
		
		override public function SetStat(aStatList:Vector.<Stat>):void 
		{
			super.SetStat(aStatList);
			
			mSpeed = aStatList[0];
			mAttack = aStatList[1];
			mCritChance = aStatList[2];
		}
		
		override public function Update():void 
		{
			super.Update();
			
			mAttackTimer += GameTime.DeltaTime;
			
			if (mAttackTimer >= mSpeed.Value)
			{
				var damage:Number = mAttack.Value;
				var critRatio:Number = mCritChance.Value / 100;
				
				if (Math.random() <= critRatio)
				{
					//CRITICAL
					damage *= 2;
					//(mView as CombatView).DisplayStat("CRITICAL HIT!!1!!", 0xFFFFFF, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2) - OffsetValues.CRITICAL_UI_Y_OFFSET));
				}
				
				mState = EState.ATTACK;
				
				dispatchEvent(new SkillEvent(SkillEvent.STAT_MODIFIER, EStat.HEALTH, -damage, ETarget.OTHER));
				mAttackTimer = mAttackTimer - mSpeed.Value;
				mAttackHitTimer = 0;
			}
			if (mState == EState.ATTACK)
			{
				mAttackHitTimer += GameTime.DeltaTime;
				
				if (mAttackHitTimer >= TIME_IN_ATTACK_HIT_STATE)
				{
					mState = EState.IDLE;
					dispatchEvent(new SkillEvent(SkillEvent.STATE));
					mAttackHitTimer = mAttackHitTimer - TIME_IN_ATTACK_HIT_STATE;
				}
			}
		}
	}
}