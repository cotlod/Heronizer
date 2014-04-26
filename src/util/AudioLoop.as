package util 
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author 
	 */
	public class AudioLoop 
	{
		[Embed(source = "../../bin/assets/loop.mp3")]
		private var mLoopClass:Class;
		private var mLoop:Sound;
		public function AudioLoop() 
		{
			mLoop = new mLoopClass();
			mLoop.play(0, 999999);
		}
	}
}