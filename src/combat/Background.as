package combat 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Background extends Sprite
	{
		[Embed(source="../../bin/assets/dojo.jpg")]
		private var backgroundClass:Class;
		private var mBitmapBackground:Bitmap;
		
		public function Background()
		{
			mBitmapBackground = new backgroundClass();
			addChild(mBitmapBackground);
			mBitmapBackground.height = OffsetValues.STAGE_HEIGHT;
		}
	}
}