package combat 
{
	import combat.event.CharacterEvent;
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
			mEnemy.addEventListener(CharacterEvent.ATTACK, OnEnemyAttack);
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
		}
	}

}