package combat 
{
	import combat.event.CharacterEvent;
	import combat.skill.event.SkillEvent;
	import flash.geom.Point;
	import mvc.BaseController;
	import skill.SkillUpdate;
	import util.GameTime;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class CombatController extends BaseController
	{
		private var mPlayer:Player;
		private var mEnemy:Enemy;
		private var mCombatOver:Boolean = false;
		private var mSkillList:Vector.<Skill> = new Vector.<Skill>();
		
		public function CombatController() 
		{
			mView = new CombatView();
			mModel = new CombatModel();
			mPlayer = new Player();
			mEnemy = new Enemy();
			
			mView.addChild(mPlayer.View);
			mView.addChild(mEnemy.View);
			
			//event listeners
			//mPlayer.addEventListener(CharacterEvent.ATTACK, OnPlayerAttack);
			mPlayer.addEventListener(SkillEvent.STAT_MODIFIER, OnPlayerSkillStatModifier);
			mPlayer.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnPlayerReceivedDamage);
			mPlayer.addEventListener(CharacterEvent.CHANGED_SKILL, OnPlayerChangedSkill);
			mPlayer.addEventListener(CharacterEvent.SKILL_COOLDOWN_UPDATE, OnPlayerCooldownUpdate);
			mPlayer.addEventListener(CharacterEvent.DIED, OnPlayerDied);
			//mEnemy.addEventListener(CharacterEvent.ATTACK, OnEnemyAttack);
			mEnemy.addEventListener(SkillEvent.STAT_MODIFIER, OnEnemySkillStatModifier);
			mEnemy.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnEnemyReceivedDamage);
			mEnemy.addEventListener(CharacterEvent.DIED, OnEnemyDied);
		}
		
		private function OnEnemySkillStatModifier(e:SkillEvent):void 
		{
			
		}
		
		private function OnPlayerSkillStatModifier(e:SkillEvent):void 
		{
			
		}
		
		private function OnPlayerDied(e:CharacterEvent):void 
		{
			OnCombatOver();
		}
		
		private function OnEnemyDied(e:CharacterEvent):void 
		{
			//enemy died, give XP
			var xp:Number = 1 * mPlayer.XpModifier.Value;
			(mView as CombatView).AddXP(xp);
			dispatchEvent(new CharacterEvent(CharacterEvent.XP_UPDATED, xp));
			OnCombatOver();
		}
		
		private function OnPlayerCooldownUpdate(e:CharacterEvent):void 
		{
			(mView as CombatView).SetSkillCooldown(e.Value);
		}
		
		private function OnPlayerChangedSkill(e:CharacterEvent):void 
		{
			trace("Player goes to another skill");
		}
		
		private function OnEnemyReceivedDamage(e:CharacterEvent):void 
		{
			(mView as CombatView).DisplayStat("-" + e.Value + " HP", 0xFF0000, new Point(mEnemy.View.x + (mEnemy.View.width / 2), mEnemy.View.y + (mEnemy.View.height / 2)));
			(mView as CombatView).SetHealthBar(ECharacter.ENEMY, mEnemy.Health.Value / mEnemy.Health.OriginalValue);
		}
		
		private function OnPlayerReceivedDamage(e:CharacterEvent):void 
		{
			(mView as CombatView).DisplayStat("-" + e.Value + " HP", 0xFF0000, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2)));
			(mView as CombatView).SetHealthBar(ECharacter.PLAYER, mPlayer.Health.Value / mPlayer.Health.OriginalValue);
		}
		
		private function OnEnemyAttack(e:CharacterEvent):void 
		{
			if (!mCombatOver)
			{
				var damage:Number = mEnemy.Attack.Value;
				var critRatio:Number = mEnemy.CriticalChance.Value / 100;
				if (Math.random() <= critRatio)
				{
					//CRITICAL
					damage *= 2;
					(mView as CombatView).DisplayStat("CRITICAL HIT!!1!!", 0xFFFFFF, new Point(mEnemy.View.x + (mEnemy.View.width / 2), mEnemy.View.y + (mEnemy.View.height / 2) - OffsetValues.CRITICAL_UI_Y_OFFSET));
				}
				mEnemy.SetState(EState.ATTACK);
				mPlayer.ReceiveDamage(damage);
			}
		}
		
		private function OnPlayerAttack(e:CharacterEvent):void 
		{
			if (!mCombatOver)
			{
				var damage:Number = mPlayer.Attack.Value;
				var critRatio:Number = mPlayer.CriticalChance.Value / 100;
				if (Math.random() <= critRatio)
				{
					//CRITICAL
					damage *= 2;
					(mView as CombatView).DisplayStat("CRITICAL HIT!!1!!", 0xFFFFFF, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2) - OffsetValues.CRITICAL_UI_Y_OFFSET));
				}
				mPlayer.SetState(EState.ATTACK);
				mEnemy.ReceiveDamage(damage);
			}
		}
		
		private function OnCombatOver():void
		{
			mCombatOver = true;
		}
		
		public function SetSkillUpdate(aSkillUpdate:SkillUpdate):void
		{
			//update stats with modifiers
			for each(var playerStat:Stat in mPlayer.mStatList)
			{
				playerStat.Value = playerStat.OriginalValue;
				var modifierList:Vector.<Stat> = aSkillUpdate.GetStatListById(playerStat.Type.ID);
				for each(var modifierStat:Stat in modifierList)
				{
					playerStat.Value += modifierStat.Value;
				}
			}
			mSkillList.length = 0;
			for each(var skill:Skill in aSkillUpdate)
			{
				mSkillList.push(skill);
			}
		}
		
		override public function Update():void
		{
			mPlayer.Update();
			mEnemy.Update();
			mView.Update();
		}
	}
}