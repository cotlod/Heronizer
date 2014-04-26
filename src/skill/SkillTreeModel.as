package skill 
{
	import com.adobe.serialization.json.JSON;
	import combat.Skill;
	import flash.geom.Point;
	import mvc.BaseModel;
	import util.ISerializable;
	/**
	 * ...
	 * @author 
	 */
	public class SkillTreeModel extends BaseModel implements ISerializable
	{
		public var LastID:int;
		
		private var mSkillNodeList:Vector.<SkillNode>;
		
		public function SkillTreeModel() 
		{
			mSkillNodeList = new Vector.<SkillNode>();
		}
		
		public function AddNode(aNode:SkillNode):void 
		{
			mSkillNodeList.push(aNode);
		}
				
		public function GetSkillNodeByID(aID:int):SkillNode
		{
			for (var i:int = 0; i < mSkillNodeList.length; i++) 
			{
				if (mSkillNodeList[i].ID == aID)
				{
					return(mSkillNodeList[i]);
				}
			}
			
			return(null);
		}
		
		public function get SkillNodeList():Vector.<SkillNode> { return(mSkillNodeList); }
		
		public function FromJSON(aJSON:String):void
		{
			if (aJSON == "") { return; }
			
			var jsonObject:Object = JSON.decode(aJSON);
			var skillList:Array = jsonObject.skillList;
			
			if (skillList == null) { return; }
			
			for (var i:int = 0; i < skillList.length; i++) 
			{
				var skillNode:SkillNode = new SkillNode();
				skillNode.FromJSON(skillList[i])
				mSkillNodeList.push(skillNode);
			}
			
			LastID = i;
			
			for (var j:int = 0; j < mSkillNodeList.length; j++) 
			{
				skillNode = mSkillNodeList[j];
				
				var nodeIDListLength:int = skillNode.Connection.NodeIDList.length;
				
				for (var k:int = 0; k < nodeIDListLength; k++) 
				{
					skillNode.Connection.AddNode(GetSkillNodeByID(skillNode.Connection.NodeIDList[k]));
				}
			}
		}

		public function ToJSON():String 
		{
			var skillList:Array = new Array();
			
			var jsonObject:Object = new Object();
			
			for (var i:int = 0; i < mSkillNodeList.length; i++) 
			{
				skillList.push(mSkillNodeList[i].ToJSON());
			}
			
			jsonObject["skillList"] = skillList
			
			return(JSON.encode(jsonObject));
		}
	}

}