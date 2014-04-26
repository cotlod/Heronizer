package combat 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends BaseCharacter 
	{
		[Embed(source="../../bin/assets/joffrey.jpg")]
		private var mEnemyClass:Class;
		private var mEnemyVisual:Bitmap;
		
		public function Enemy() 
		{
			super();
			Name = "Enemy";
			mEnemyVisual = new mEnemyClass();
			mView.addChild(mEnemyVisual);
			mView.width = 100;
			mView.x = 300;
		}
		
	}

}