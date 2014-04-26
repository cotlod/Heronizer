package combat 
{
	/**
	 * ...
	 * @author 
	 */
	public class CombatController 
	{
		private var mCombatView:CombatView;
		private var mCombatModel:CombatModel;
		private var mPlayer:Player;
		private var mEnemy:Enemy;
		
		public function CombatController() 
		{
			mCombatView = new CombatView();
			mCombatModel = new CombatModel();
			mPlayer = new Player();
			mEnemy = new Enemy();
		}
		
		public function Update():void
		{
			
		}
	}

}