package combat 
{
	import combat.ui.Hud;
	import combat.ui.StatDisplay;
	import flash.events.Event;
	import flash.geom.Point;
	import mvc.BaseView;
	/**
	 * ...
	 * @author 
	 */
	public class CombatView extends BaseView
	{
		private var mBackground:Background;
		private var mHud:Hud;
		private var mStatDisplayList:Vector.<StatDisplay> = new Vector.<StatDisplay>();
		
		public function CombatView() 
		{
			mBackground = new Background();
			mHud = new Hud();
			addChild(mBackground);
			addChild(mHud);
		}
		
		public function DisplayStat(aText:String, aColor:uint, aPosition:Point):void
		{
			var tempDisplay:StatDisplay = new StatDisplay(aText, aColor);
			tempDisplay.x = aPosition.x;
			tempDisplay.y = aPosition.y;
			addChild(tempDisplay);
			tempDisplay.addEventListener(Event.COMPLETE, OnStatDisplayComplete);
			mStatDisplayList.push(tempDisplay);
		}
		
		private function OnStatDisplayComplete(e:Event):void 
		{
			var statDisplay:StatDisplay = e.target as StatDisplay;
			removeChild(statDisplay);
			statDisplay.removeEventListener(Event.COMPLETE, OnStatDisplayComplete);
			var index:int = mStatDisplayList.indexOf(statDisplay);
			mStatDisplayList.splice(index, 1);
		}
		
		override public function Update():void
		{
			var statDisplay:StatDisplay;
			for (var i:int = mStatDisplayList.length - 1; i >= 0; i-- )
			{
				statDisplay = mStatDisplayList[i];
				statDisplay.Update();
			}
		}
	}

}