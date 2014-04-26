package combat 
{
	import combat.event.CharacterEvent;
	import flash.geom.Point;
	import mvc.BaseController;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class CombatController extends BaseController
	{
		private var mPlayer:Player;
		private var mEnemy:Enemy;
		
		public function CombatController() 
		{
			mView = new CombatView();
			mModel = new CombatModel();
			mPlayer = new Player();
			mEnemy = new Enemy();
			
			mView.addChild(mPlayer.View);
			mView.addChild(mEnemy.View);
			
			//event listeners
			mPlayer.addEventListener(CharacterEvent.ATTACK, OnPlayerAttack);
			mPlayer.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnPlayerReceivedDamage);
			mPlayer.addEventListener(CharacterEvent.CHANGED_SKILL, OnPlayerChangedSkill);
			mPlayer.addEventListener(CharacterEvent.SKILL_COOLDOWN_UPDATE, OnPlayerCooldownUpdate);
			mEnemy.addEventListener(CharacterEvent.ATTACK, OnEnemyAttack);
			mEnemy.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnEnemyReceivedDamage);
			mEnemy.addEventListener(CharacterEvent.DIED, OnEnemyDied);
		}
		
		private function OnEnemyDied(e:CharacterEvent):void 
		{
			//enemy died, give XP
			var xp:Number = 1 * mPlayer.XpModifier.Value;
			(mView as CombatView).AddXP(xp);
			dispatchEvent(new CharacterEvent(CharacterEvent.XP_UPDATED, xp));
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
			var damage:Number = mEnemy.Attack.Value;
			var critRatio:Number = mEnemy.CriticalChance.Value / 100;
			if (Math.random() <= critRatio)
			{
				//CRITICAL
				damage *= 2;
				(mView as CombatView).DisplayStat("CRITICAL HIT!!1!!", 0xFFFFFF, new Point(mEnemy.View.x + (mEnemy.View.width / 2), mEnemy.View.y + (mEnemy.View.height / 2)));
			}
			mEnemy.SetState(EState.ATTACK);
			mPlayer.ReceiveDamage(damage);
		}
		
		private function OnPlayerAttack(e:CharacterEvent):void 
		{
			var damage:Number = mPlayer.Attack.Value;
			var critRatio:Number = mPlayer.CriticalChance.Value / 100;
			if (Math.random() <= critRatio)
			{
				//CRITICAL
				damage *= 2;
				(mView as CombatView).DisplayStat("CRITICAL HIT!!1!!", 0xFFFFFF, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2)));
			}
			mPlayer.SetState(EState.ATTACK);
			mEnemy.ReceiveDamage(damage);
		}
		
		override public function Update():void
		{
			mPlayer.Update();
			mEnemy.Update();
			mView.Update();
		}
	}
}