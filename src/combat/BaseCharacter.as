package combat 
{
	import mvc.BaseController;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class BaseCharacter extends BaseController
	{
		public var Strength:int = 1;
		public var Speed:int = 1;
		public var HealthPoints:int = 10;
		
		public function BaseCharacter() 
		{
			mView = new CharacterView();
		}
		
		override public function Update():void
		{
			
		}
	}

}