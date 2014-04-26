package skill 
{
	import combat.Skill;
	import flash.geom.Point;
	import mvc.BaseModel;
	/**
	 * ...
	 * @author 
	 */
	public class SkillTreeModel extends BaseModel
	{
		private var mSkillNodeList:Vector.<SkillNode>;
		
		public function SkillTreeModel() 
		{
			mSkillNodeList = new Vector.<SkillNode>();
		}
		
		public function get SkillNodeList():Vector.<SkillNode> { return(mSkillNodeList); }
		
		public function FromJSON(aJSON:String):void
		{
		}
		
		public function AddNode(aNode:SkillNode):void 
		{
			mSkillNodeList.push(aNode);
		}
	}

}