package combat.ui 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author 
	 */
	public class ProgressBar extends Sprite
	{
		private var mRatio:Number = 1;
		
		public function ProgressBar() 
		{
			
		}
		
		public function SetRatio(aRatio:Number):void
		{
			mRatio = aRatio;
		}
	}

}