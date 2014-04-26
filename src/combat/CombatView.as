package combat 
{
	import combat.ui.Hud;
	/**
	 * ...
	 * @author 
	 */
	public class CombatView 
	{
		private var mBackground:Background;
		private var mHud:Hud;
		
		public function CombatView() 
		{
			mBackground = new Background();
			mHud = new Hud();
		}
		
	}

}