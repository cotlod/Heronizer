package skill 
{
	import com.adobe.serialization.json.JSON;
	import combat.ESkill;
	import combat.EStat;
	import combat.Skill;
	import combat.Stat;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import util.ISerializable;
	import util.IUpdatable;
	/**
	 * ...
	 * @author 
	 */
	public class SkillNode extends Sprite implements IUpdatable, ISerializable
	{
		private var mID:int;
		
		private var mStat:Stat;
		private var mSkill:Skill;
		
		private var mPosition:Point;
		
		private var mNodeConnection:NodeConnection;
		
		private var mUnlocked:Boolean;
		private var mRendered:Boolean;
		
		private var mXPGate:int;
		
		private var mDescription:TextField;
		
		public function SkillNode(aID:int = -1, aStat:Stat = null, aSkill:Skill = null) 
		{
			mID = aID;
			mStat = aStat;
			mSkill = aSkill;
			
			mNodeConnection = new NodeConnection();
			mPosition = new Point();
		}
		
		public function SetDescription():void
		{
			mDescription = new TextField();
			mDescription.x = -15;
			mDescription.y = -15;
			mDescription.width = 30;
			mDescription.selectable = false;
			mDescription.mouseEnabled = false;
			mDescription.autoSize = TextFieldAutoSize.CENTER;
			mDescription.multiline = true;
			
			mDescription.appendText(mID.toString());
			if (mStat)
			{
				mDescription.appendText("\n +" + mStat.Value + " " + mStat.Type.Name);
			}
			else
			{
				mDescription.appendText("\n" + mSkill.Type.Name)
			}
			
			mDescription.appendText("\n Cost " + mXPGate);
			
			mDescription.setTextFormat(new TextFormat("Helvetica", 12, null,null,null,null,null,null,TextFormatAlign.CENTER))
			addChild(mDescription);
		}
		
		public function get Position():Point { return(mPosition); }
		
		public function get Connection():NodeConnection { return(mNodeConnection); }
		
		public function get ID():int { return(mID); }
		public function set ID(aValue:int):void { mID = aValue; }
		
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
			var jsonObject:Object = JSON.decode(aJSON);
			
			mID = jsonObject.id;
			
			if (jsonObject.stat != null)
			{
				mStat = new Stat(jsonObject.stat.Value, jsonObject.stat.Modifier, EStat.GetStatByID(jsonObject.stat.Type.ID));
			}
			
			if (jsonObject.skillID != null)
			{
				mSkill = new Skill(ESkill.GetSkillByID(jsonObject.skillID));
			}
			
			jsonObject.position = JSON.decode(jsonObject.position);
			
			mNodeConnection.FromJSON(jsonObject.nodeConnection);
			
			mPosition.x = jsonObject.position.x;
			mPosition.y = jsonObject.position.y;
			mUnlocked = jsonObject.unlocked;
			mXPGate = jsonObject.xpGate;
			
			SetDescription();
		}
		
		public function ToJSON():String 
		{
			var jsonObject:Object = new Object();
			
			jsonObject["id"] = mID;
			jsonObject["stat"] = mStat;
			jsonObject["skillID"] = (mSkill) ? mSkill.Type.ID : null;
			jsonObject["position"] = JSON.encode({x:mPosition.x, y:mPosition.y});
			jsonObject["nodeConnection"] = mNodeConnection.ToJSON();
			jsonObject["unlocked"] = mUnlocked;
			jsonObject["xpGate"] = mXPGate;
			
			return(JSON.encode(jsonObject));
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