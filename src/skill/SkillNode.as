package skill 
{
	import combat.ESkill;
	import combat.Skill;
	import combat.Stat;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
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
		
		private var mDescription:TextField;
		
		public function SkillNode(aStat:Stat, aSkill:Skill) 
		{
			mStat = aStat;
			mSkill = aSkill;
			
			mNodeConnection = new NodeConnection();
			mPosition = new Point();
		}
		
		public function SetDescription():void
		{
			mDescription = new TextField();
			mDescription.selectable = false;
			mDescription.mouseEnabled = false;
			
			if (mStat)
			{
				mDescription.text = mStat.Type.Name;
			}
			else
			{
				mDescription.text = mSkill.Type.Name
			}
			
			mDescription.text += "\n" + mXPGate;
			
			addChild(mDescription);
		}
		
		public function get Position():Point { return(mPosition); }
		
		public function get Connection():NodeConnection { return(mNodeConnection); }
		
		public function get XPGate():int { return(mXPGate); }
		public function set XPGate(aValue:int):void { mXPGate = aValue; }
		
		public function get Unlocked():Boolean { return(mUnlocked); }
		public function set Unlocked(aValue:Boolean):void { mUnlocked = aValue; }
		
		public function get Rendered():Boolean { return(mRendered); }
		public function set Rendered(aValue:Boolean):void { mRendered = aValue; }
		
		public function get NodeStat():Stat { return(mStat); }
		
		public function get NodeSkill():Skill { return(mSkill); }
		
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