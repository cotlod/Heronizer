package util 
{
	import flash.media.Sound;
	/**
	 * ...
	 * @author 
	 */
	public class ToastAttackSound 
	{
		[Embed(source = "../../bin/assets/toast_attack.mp3")]
		private var mSoundClass:Class;
		private var mSound:Sound;
		public function ToastAttackSound() 
		{
			mSound = new mSoundClass();
			mSound.play();
		}
		
	}

}