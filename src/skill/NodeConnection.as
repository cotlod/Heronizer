package skill 
{
	import com.adobe.serialization.json.JSON;
	import util.ISerializable;
	/**
	 * ...
	 * @author 
	 */
	public class NodeConnection implements ISerializable
	{
		private var mSkillNodeList:Vector.<SkillNode>;
		private var mSkillNodeIDList:Array;
		
		public function NodeConnection() 
		{
			mSkillNodeList = new Vector.<SkillNode>();
		}
		
		public function AddNode(aSkillNode:SkillNode):void
		{
			for (var i:int = 0; i < mSkillNodeList.length; i++) 
			{
				if (mSkillNodeList[i] == aSkillNode)
				{
					return;
				}
			}
			
			mSkillNodeList.push(aSkillNode);
		}
		
		public function IsAvailable():Boolean 
		{			
			for (var i:int = 0; i < mSkillNodeList.length; i++) 
			{
				if (mSkillNodeList[i].Unlocked)
				{
					return(true);
				}
			}
			
			return(false);
		}
		
		public function get NodeList():Vector.<SkillNode> { return(mSkillNodeList); }
		public function get NodeIDList():Array { return(mSkillNodeIDList); }
		
		public function FromJSON(aJSON:String):void 
		{
			mSkillNodeIDList = JSON.decode(aJSON);
		}
		
		public function ToJSON():String 
		{
			var jsonString:String = "[";
			
			for (var i:int = 0; i < mSkillNodeList.length; i++) 
			{
				if (i == mSkillNodeList.length - 1)
				{
					jsonString += mSkillNodeList[i].ID.toString();
				}
				else
				{
					jsonString += mSkillNodeList[i].ID + ",";
				}
			}
			
			jsonString += "]";
			
			return(jsonString);
		}
	}

}