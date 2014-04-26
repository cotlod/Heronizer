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
			mEnemy.addEventListener(CharacterEvent.ATTACK, OnEnemyAttack);
			mEnemy.addEventListener(CharacterEvent.RECEIVED_DAMAGE, OnEnemyReceivedDamage);
		}
		
		private function OnEnemyReceivedDamage(e:CharacterEvent):void 
		{
			(mView as CombatView).DisplayStat("-" + mPlayer.Attack.Value + " HP", 0xFF0000, new Point(mEnemy.View.x + (mEnemy.View.width / 2), mEnemy.View.y + (mEnemy.View.height / 2)));
		}
		
		private function OnPlayerReceivedDamage(e:CharacterEvent):void 
		{
			(mView as CombatView).DisplayStat("-" + mEnemy.Attack.Value + " HP", 0xFF0000, new Point(mPlayer.View.x + (mPlayer.View.width / 2), mPlayer.View.y + (mPlayer.View.height / 2)));
		}
		
		private function OnEnemyAttack(e:CharacterEvent):void 
		{
			mPlayer.SendDamage(mEnemy.Attack.Value);
		}
		
		private function OnPlayerAttack(e:CharacterEvent):void 
		{
			mEnemy.SendDamage(mPlayer.Attack.Value);
		}
		
		override public function Update():void
		{
			mPlayer.Update();
			mEnemy.Update();
			mView.Update();
		}
	}

}