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
		[Embed(source="../../bin/assets/BG_01.png")]
		private var background1Class:Class;
		private var mBitmap1Background:Bitmap;
		[Embed(source="../../bin/assets/BG_02.png")]
		private var background2Class:Class;
		private var mBitmap2Background:Bitmap;
		private var mCurrentBackground:int = 0;
		
		public function Background()
		{
			mCurrentBackground = 0;
			mBitmap1Background = new background1Class();
			mBitmap2Background = new background2Class();
			addChild(mBitmap1Background);
			//addChild(mBitmap2Background);
		}
		
		public function ToggleBackground():void
		{
			if (mCurrentBackground == 0)
			{
				mCurrentBackground = 1;
				removeChild(mBitmap1Background);
				addChild(mBitmap2Background);
			}
			else
			{
				mCurrentBackground = 0;
				removeChild(mBitmap2Background);
				addChild(mBitmap1Background);
			}
		}
	}
}