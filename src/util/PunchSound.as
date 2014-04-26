package util 
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author 
	 */
	public class PunchSound 
	{
		[Embed(source = "../../bin/assets/punch.mp3")]
		private var mSoundClass:Class;
		private var mSound:Sound;
		public function PunchSound() 
		{
			mSound = new mSoundClass();
			mSound.play();
		}
		
	}

}