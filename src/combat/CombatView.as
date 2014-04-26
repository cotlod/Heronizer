package combat 
{
	import combat.ui.Hud;
	import mvc.BaseView;
	/**
	 * ...
	 * @author 
	 */
	public class CombatView extends BaseView
	{
		private var mBackground:Background;
		private var mHud:Hud;
		
		public function CombatView() 
		{
			mBackground = new Background();
			mHud = new Hud();
			addChild(mBackground);
			addChild(mHud);
		}
		
		override public function Update():void
		{
			
		}
	}

}