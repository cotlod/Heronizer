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
			mSkillNodeList.push(aSkillNode);
		}
		
		public function get NodeList():Vector.<SkillNode> { return(mSkillNodeList); }
	}

}