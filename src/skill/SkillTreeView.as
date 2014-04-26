package skill 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import mvc.BaseView;
	/**
	 * ...
	 * @author 
	 */
	public class SkillTreeView extends BaseView
	{
		private var mMask:Sprite;
		private var mScrollOffset:Point;
		
		public function SkillTreeView() 
		{
			mMask = new Sprite();
			
			mMask.graphics.beginFill(0x000000);
			mMask.graphics.drawRect(0, 0, 615, 768);
			mMask.graphics.endFill();
			//mMask.mouseEnabled = false;
			mMask.visible = false;
			addChild(mMask);
			
			mask = mMask;
		}
		
		public function Render(aSkillNode:SkillNode):void
		{
			var connectionList:Vector.<SkillNode> = aSkillNode.Connection.NodeList
			
			for (var i:int = 0; i < connectionList.length; i++) 
			{
				graphics.lineStyle(2, 0x000000);
				graphics.moveTo(aSkillNode.Position.x + mScrollOffset.x, aSkillNode.Position.y + mScrollOffset.y);
				graphics.lineTo(connectionList[i].Position.x + mScrollOffset.x, connectionList[i].Position.y + mScrollOffset.y);
			}
			aSkillNode.x = aSkillNode.Position.x + mScrollOffset.x;
			aSkillNode.y = aSkillNode.Position.y + mScrollOffset.y;
			addChild(aSkillNode);
		}
		
		override public function Update():void 
		{
			graphics.clear();
			
			graphics.beginFill(0xCCFFFF);
			graphics.drawRect(0, 0, 615, 768);
			graphics.endFill();
			
			super.Update();
		}
		
		public function SetOffset(aScrollOffset:Point):void 
		{
			mScrollOffset = aScrollOffset;
		}
	}

}