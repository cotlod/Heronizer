package skill 
{
	/**
	 * ...
	 * @author 
	 */
	public class NodeConnection 
	{
		private var mSkillNodeList:Vector.<SkillNode>;
		
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
	}

}