package combat.ui 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class StatDisplay extends Sprite
	{
		private static const TIME_TO_DISAPPEAR:Number = 3;
		private var mTimeDisplayed:Number = 0;
		private var mTextField:TextField;
		public function StatDisplay(aText:String, aColor:uint = 0x0) 
		{
			mTextField = new TextField();
			mTextField.mouseEnabled = false;
			
			mTextField.text = aText;
			mTextField.selectable = false;
			mTextField.setTextFormat(new TextFormat("Arial", 20, aColor, true));
			addChild(mTextField);
		}
		
		public function Update():void
		{
			mTimeDisplayed += GameTime.DeltaTime;
			if (mTimeDisplayed >= TIME_TO_DISAPPEAR)
			{
				removeChild(mTextField);
				mTextField = null;
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
	}

}