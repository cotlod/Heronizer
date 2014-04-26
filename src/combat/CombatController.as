package combat
{
	import combat.event.CharacterEvent;
	import combat.skill.DeadSkill;
	import combat.skill.event.SkillEvent;
	import flash.events.MouseEvent;
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
		
		private var mShake:Boolean;
		private var mShakeTime:int;
		private var mShakeX:Number;
		private var mShakeY:Number;
		
		public function CombatController()
		{
			mView = new CombatView();
			mModel = new CombatModel();
			mPlayer = new Player();
			mPlayer.Init();
			mEnemy = new Enemy();
			mEnemy.Init();
			
			mEnemy.View.addEventListener(MouseEvent.CLICK, OnEnemyClick);
			
			mView.addChild(mPlayer.View);
			mView.addChild(mEnemy.View);
			
			//event listeners
			mPlayer.addEventListener(SkillEvent.STAT_MODIFIER, OnPlayerSkillStatModifier);
			mPlayer.addEventListener(SkillEvent.CHANGE_BACKGROUND, OnBackgroundChange);
			mPlayer.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnPlayerReceivedDamage);
			mPlayer.addEventListener(CharacterEvent.CHANGED_SKILL, OnPlayerChangedSkill);
			mEnemy.addEventListener(SkillEvent.STAT_MODIFIER, OnEnemySkillStatModifier);
			mEnemy.addEventListener(SkillEvent.CHANGE_BACKGROUND, OnBackgroundChange);
			mEnemy.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnEnemyReceivedDamage);
		}
		
		private function OnEnemyClick(e:MouseEvent):void
		{
			Shake(10);
			
			if (mEnemy.CurrentSkill.Type.ID == ESkill.DEAD.ID)
			{
				return;
			}
			
			var health:Stat = mEnemy.GetStatByID(EStat.HEALTH.ID);
			health.Value = health.Value - 1;
			
			CheckDead(mEnemy);
			
			OnEnemyReceivedDamage(null);
		}
		
		private function Shake(aTime:int):void 
		{
			if (!isNaN(mShakeX))
			{
				mEnemy.View.x = mShakeX;
				mEnemy.View.y = mShakeY;
			}
			
			mShake = true;
			mShakeTime = aTime;
			mShakeX = mEnemy.View.x;
			mShakeY = mEnemy.View.y;
		}
		
		private function OnBackgroundChange(e:SkillEvent):void
		{
			(mView as CombatView).ToggleBackground();
		}
		
		private function OnEnemySkillStatModifier(e:SkillEvent):void
		{
			var statToModify:Stat;
			var color:uint = e.Value >= 0 ? 0x00FF00 : 0xFF0000;
			if (e.Target == ETarget.SELF)
			{
				statToModify = mEnemy.GetStatByID(e.StatModified.ID);
				if (statToModify != null)
				{
					statToModify.Value += e.Value;
					if (e.StatModified.ID == EStat.HEALTH.ID)
					{
						(mView as CombatView).SetHealthBar(ECharacter.ENEMY, mEnemy.GetStatByID(EStat.HEALTH.ID).Value / mEnemy.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, color, new Point(mEnemy.View.x + (mEnemy.View.width / 2), 500));
				}
			}
			else
			{
				statToModify = mPlayer.GetStatByID(e.StatModified.ID);
				if (statToModify != null)
				{
					statToModify.Value += e.Value;
					if (e.StatModified.ID == EStat.HEALTH.ID)
					{
						if (mPlayer.mCurrentState != EState.ATTACK)
						{
							mPlayer.SetState(EState.HIT);
						}
						(mView as CombatView).SetHealthBar(ECharacter.PLAYER, mPlayer.GetStatByID(EStat.HEALTH.ID).Value / mPlayer.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, color, new Point(70, 500));
				}
			}
			
			CheckDead(mEnemy);
		}
		
		private function CheckDead(aCharacter:BaseCharacter):void
		{
			if (mEnemy.GetStatByID(EStat.HEALTH.ID).Value <= 0)
			{
				var xpValueStat:Stat = mEnemy.GetStatByID(EStat.XP_VALUE.ID);
				
				//var enemyXPValue:Number = xpValueStat.Value 
				var enemyXPValue:Number = 100;
				var playerXPModifier:Number = mPlayer.GetStatByID(EStat.XP_MODIFIER.ID).Value
				var xp:Number = enemyXPValue * playerXPModifier;
				dispatchEvent(new CharacterEvent(CharacterEvent.XP_UPDATED, xp));
				mEnemy.SetSkill(new DeadSkill());
			}
		}
		
		private function OnPlayerSkillStatModifier(e:SkillEvent):void
		{
			var statToModify:Stat;
			var color:uint = e.Value >= 0 ? 0x00FF00 : 0xFF0000;
			if (e.Target == ETarget.SELF)
			{
				statToModify = mPlayer.GetStatByID(e.StatModified.ID);
				
				if (statToModify != null)
				{
					statToModify.Value += e.Value;
					if (e.StatModified.ID == EStat.HEALTH.ID)
					{
						statToModify.Value = Math.max(0, Math.min(statToModify.Value, statToModify.OriginalValue));
						(mView as CombatView).SetHealthBar(ECharacter.PLAYER, mPlayer.GetStatByID(EStat.HEALTH.ID).Value / mPlayer.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, color, new Point(70, 500));
				}
			}
			else
			{
				statToModify = mEnemy.GetStatByID(e.StatModified.ID);
				if (statToModify != null)
				{
					statToModify.Value += e.Value;
					if (e.StatModified.ID == EStat.HEALTH.ID)
					{
						if (mEnemy.mCurrentState != EState.ATTACK)
						{
							mEnemy.SetState(EState.HIT);
						}
						(mView as CombatView).SetHealthBar(ECharacter.ENEMY, mEnemy.GetStatByID(EStat.HEALTH.ID).Value / mEnemy.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, color, new Point(mEnemy.View.x + (mEnemy.View.width / 2), 500));
				}
				
				Shake(12);
			}
			
			if (mPlayer.GetStatByID(EStat.HEALTH.ID).Value <= 0)
			{
				mPlayer.SetSkill(new DeadSkill());
			}
		}
		
		private function OnPlayerChangedSkill(e:CharacterEvent):void
		{
			trace("Player goes to another skill");
		}
		
		private function OnEnemyReceivedDamage(e:CharacterEvent):void
		{
			(mView as CombatView).SetHealthBar(ECharacter.ENEMY, mEnemy.GetStatByID(EStat.HEALTH.ID).Value / mEnemy.GetStatByID(EStat.HEALTH.ID).OriginalValue);
		}
		
		private function OnPlayerReceivedDamage(e:CharacterEvent):void
		{
			(mView as CombatView).SetHealthBar(ECharacter.PLAYER, mPlayer.GetStatByID(EStat.HEALTH.ID).Value / mPlayer.GetStatByID(EStat.HEALTH.ID).OriginalValue);
		}
		
		private function OnCombatOver():void
		{
			mCombatOver = true;
		}
		
		public function SetSkillUpdate(aSkillUpdate:SkillUpdate):void
		{
			//update stats with modifiers
			for each (var playerStat:Stat in mPlayer.GetStatList())
			{
				playerStat.Value = playerStat.OriginalValue;
				var modifierList:Vector.<Stat> = aSkillUpdate.GetStatListById(playerStat.Type.ID);
				for each (var modifierStat:Stat in modifierList)
				{
					playerStat.Value += modifierStat.Value;
				}
			}
			mSkillList.length = 0;
			for each (var skill:Skill in aSkillUpdate)
			{
				mSkillList.push(skill);
			}
		}
		
		override public function Update():void
		{
			if (mPlayer.CurrentSkill)
			{
				(mView as CombatView).SetSkillCooldown(mPlayer.CurrentSkill.Elapsed / mPlayer.CurrentSkill.Duration);
			}
			
			mPlayer.Update();
			
			if (mShake && mShakeTime-- > 0)
			{
				mEnemy.View.x = mShakeX;
				mEnemy.View.y = mShakeY;
				
				mEnemy.View.x += Math.random() * 10 - 20;
				mEnemy.View.y += Math.random() * 10 - 20;
				
				if (mShakeTime == 0)
				{
					mEnemy.View.x = mShakeX;
					mEnemy.View.y = mShakeY;
				}
			}
			
			mEnemy.Update();
			mView.Update();
		}
	}
}