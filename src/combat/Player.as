package combat 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author 
	 */
	public class Player extends BaseCharacter 
	{
		[Embed(source="../../bin/assets/superman.gif")]
		private var mPlayerClass:Class;
		private var mPlayerVisual:Bitmap;
		public function Player() 
		{
			super();
			Name = "Player";
			mPlayerVisual = new mPlayerClass();
			mView.addChild(mPlayerVisual);
			mView.width = 100;
		}
		
	}

}