package skill 
{
	import combat.Skill;
	import combat.Stat;
	import flash.display.Sprite;
	import flash.geom.Point;
	import util.ISerializable;
	import util.IUpdatable;
	/**
	 * ...
	 * @author 
	 */
	public class SkillNode extends Sprite implements IUpdatable, ISerializable
	{
		private var mStat:Stat;
		private var mSkill:Skill;
		
		private var mPosition:Point;
		
		private var mNodeConnection:NodeConnection;
		
		private var mUnlocked:Boolean;
		private var mRendered:Boolean;
		
		private var mXPGate:int;
		
		public function SkillNode() 
		{
			mNodeConnection = new NodeConnection();
			mPosition = new Point();
		}
		
		public function get Position():Point { return(mPosition); }
		
		public function get Connection():NodeConnection { return(mNodeConnection); }
		
		public function get XPGate():int { return(mXPGate); }
		public function set XPGate(aValue:int):void { mXPGate = aValue; }
		
		public function get Unlocked():Boolean { return(mUnlocked); }
		public function set Unlocked(aValue:Boolean):void { mUnlocked = aValue; }
		
		public function get Rendered():Boolean { return(mRendered); }
		public function set Rendered(aValue:Boolean):void { mRendered = aValue; }
		
		public function FromJSON(aJSON:String):void
		{
			
		}
		
		public function ToJSON():String 
		{
			return("");
		}
		
		public function Update():void 
		{
			x = mPosition.x;
			y = mPosition.y;
			
			graphics.clear();
			if (Unlocked)
			{
				graphics.beginFill(0x00FF00);
			}
			else
			{
				graphics.beginFill(0xFF0000);
			}
			graphics.drawCircle(0, 0, 30);
			graphics.endFill();
		}		
	}
}