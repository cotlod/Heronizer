package combat 
{
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
		}
		
		override public function Update():void
		{
			mPlayer.Update();
			mEnemy.Update();
			
			
		}
	}

}