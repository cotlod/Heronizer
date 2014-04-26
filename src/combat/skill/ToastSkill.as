package combat.skill 
{
	import combat.ESkill;
	import combat.EStat;
	import combat.EState;
	import combat.ETarget;
	import combat.PlayerAsset;
	import combat.Skill;
	import combat.skill.event.SkillEvent;
	import combat.Stat;
	import combat.State;
	import util.GameTime;
	import util.ToastAttackSound;
	/**
	 * ...
	 * @author 
	 */
	public class ToastSkill extends Skill
	{
		private static const TIME_IN_ATTACK_HIT_STATE:Number = 1;
		private var mAttackTimer:Number = 0;
		private var mAttackHitTimer:Number = 0;
		
		private var mAttack:Stat;
		private var mSpeed:Stat;
		private var mSkillDuration:Stat;
		private var mCritChance:Stat;
		
		private var mXPModifier:Number;
		
		public function ToastSkill() 
		{
			super(ESkill.TOAST);
			
			mStateList.length = 0;
			mStateList.push(new State(EState.IDLE, PlayerAsset.IDLE_TOAST));
			mStateList.push(new State(EState.ATTACK, PlayerAsset.STRIKE_TOAST));
			
			mState = mStateList[0];
		}
		
		override public function SetStat(aStatList:Vector.<Stat>):void 
		{
			super.SetStat(aStatList);
			
			mAttack = aStatList[0];
			mSpeed = aStatList[1];
			//mSkillDuration = aStatList[2];
			
			//mDuration += mSkillDuration.Value;
			mCritChance = aStatList[2];
			mXPModifier = aStatList[3].Value * 2;
		}
		
		override public function Update():void 
		{
			super.Update();
			
			mAttackTimer += GameTime.DeltaTime;
			
			if (mState.ID == EState.IDLE && mAttackTimer >= mSpeed.Value * 2)
			{
				var damage:Number = mAttack.Value * 2;
				var critRatio:Number = mCritChance.Value * 2 / 100;
				
				if (Math.random() <= critRatio)
				{
					//CRITICAL
					damage *= 2;
					//(mView as CombatView).DisplayStat("CRITICAL HIT!!1!!", 0xFFFFFF, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2) - OffsetValues.CRITICAL_UI_Y_OFFSET));
				}
				
				mState = mStateList[1];
				new ToastAttackSound();
				dispatchEvent(new SkillEvent(SkillEvent.STAT_MODIFIER, EStat.HEALTH, -damage, ETarget.OTHER));
				mAttackTimer = 0;
			}
			else if (mState.ID == EState.ATTACK && mAttackTimer >= mSpeed.Value * 2)
			{				
				mState = mStateList[0];
				dispatchEvent(new SkillEvent(SkillEvent.STATE));
				mAttackTimer = 0;
			}
		}
	}
}