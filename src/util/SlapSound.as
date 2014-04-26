package util 
{
	/**
	 * ...
	 * @author 
	 */
	public class SlapSound 
	{
		[Embed(source = "../../bin/assets/slap.mp3")]
		private var mSoundClass:Class;
		private var mSound:Sound;
		public function SlapSound() 
		{
			mSound = new mSoundClass();
			mSound.play();
		}
		
	}

}