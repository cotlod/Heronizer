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
			var skillNodeA:SkillNode = new SkillNode();
			skillNodeA.Position = new Point(10, 230);
			
			var skillNodeB:SkillNode = new  SkillNode();
			skillNodeB.Position = new Point(40, 200);
			
			var skillNodeC:SkillNode = new  SkillNode();
			skillNodeC.Position = new Point(400, 200);
			
			var skillNodeD:SkillNode = new  SkillNode();
			skillNodeD.Position = new Point(120, 100);
			
			var skillNodeE:SkillNode = new  SkillNode();
			skillNodeE.Position = new Point(300, 10);
			
			skillNodeA.Connection.AddNode(skillNodeB);
			skillNodeA.Connection.AddNode(skillNodeC);
			skillNodeC.Connection.AddNode(skillNodeD);
			skillNodeD.Connection.AddNode(skillNodeE);
			skillNodeE.Connection.AddNode(skillNodeB);
			skillNodeE.Connection.AddNode(skillNodeC);
			
			mSkillNodeList.push(skillNodeA);
			mSkillNodeList.push(skillNodeB);
			mSkillNodeList.push(skillNodeC);
			mSkillNodeList.push(skillNodeD);
			mSkillNodeList.push(skillNodeE);
		}
	}

}