package combat 
{
	import combat.event.CharacterEvent;
	import combat.skill.DeadSkill;
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
			mPlayer.Init();
			mEnemy = new Enemy();
			mEnemy.Init();
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
		
		private function OnBackgroundChange(e:SkillEvent):void 
		{
			(mView as CombatView).ToggleBackground();
		}
		
		private function OnEnemySkillStatModifier(e:SkillEvent):void 
		{
			var statToModify:Stat;
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
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, 0xFF0000, new Point(mEnemy.View.x + (mEnemy.View.width / 2), mEnemy.View.y + (mEnemy.View.height / 2)));
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
						(mView as CombatView).SetHealthBar(ECharacter.PLAYER, mPlayer.GetStatByID(EStat.HEALTH.ID).Value / mPlayer.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, 0xFF0000, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2)));
				}
			}
			
			if (mEnemy.GetStatByID(EStat.HEALTH.ID).Value <= 0)
			{
				var xpValueStat:Stat = mEnemy.GetStatByID(EStat.XP_VALUE.ID);
				
				//var enemyXPValue:Number = xpValueStat.Value 
				var enemyXPValue:Number =100;
				var playerXPModifier:Number = mPlayer.GetStatByID(EStat.XP_MODIFIER.ID).Value 
				var xp:Number = enemyXPValue * playerXPModifier;
				dispatchEvent(new CharacterEvent(CharacterEvent.XP_UPDATED, xp));
				mEnemy.SetSkill(new DeadSkill());
			}
		}
		
		private function OnPlayerSkillStatModifier(e:SkillEvent):void 
		{
			var statToModify:Stat;
			if (e.Target == ETarget.SELF)
			{
				statToModify = mPlayer.GetStatByID(e.StatModified.ID);
				
				if (statToModify != null)
				{
					statToModify.Value += e.Value;
					if (e.StatModified.ID == EStat.HEALTH.ID)
					{
						(mView as CombatView).SetHealthBar(ECharacter.PLAYER, mPlayer.GetStatByID(EStat.HEALTH.ID).Value / mPlayer.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, 0xFF0000, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2)));
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
						(mView as CombatView).SetHealthBar(ECharacter.ENEMY, mEnemy.GetStatByID(EStat.HEALTH.ID).Value / mEnemy.GetStatByID(EStat.HEALTH.ID).OriginalValue);
					}
					(mView as CombatView).DisplayStat(e.Value + " " + statToModify.Type.Name, 0xFF0000, new Point(mEnemy.View.x + (mEnemy.View.width / 2), mEnemy.View.y + (mEnemy.View.height / 2)));
				}
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
			for each(var playerStat:Stat in mPlayer.GetStatList())
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
			(mView as CombatView).SetSkillCooldown(mPlayer.CurrentSkill.Elapsed / mPlayer.CurrentSkill.Duration);
			
			mPlayer.Update();
			mEnemy.Update();
			mView.Update();
		}
	}
}