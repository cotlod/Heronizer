package util 
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author 
	 */
	public class DickHitSound 
	{
		[Embed(source = "../../bin/assets/dick_hit.mp3")]
		private var mSoundClass:Class;
		private var mSound:Sound;
		public function DickHitSound() 
		{
			mSound = new mSoundClass();
			mSound.play();
		}
		
	}

}