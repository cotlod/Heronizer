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
		private var mBackground:Sprite;
		private var mPathContainer:Sprite;
		private var mScrollOffset:Point;
		
		public function SkillTreeView() 
		{
			mMask = new Sprite();
			
			mMask.graphics.beginFill(0x000000);
			mMask.graphics.drawRect(0, 0, 615, 768);
			mMask.graphics.endFill();
			//mMask.visible = false;
			addChild(mMask);
			
			mask = mMask;
			
			mBackground  = new Sprite();
			
			mBackground.graphics.beginFill(0xCCFFFF);
			mBackground.graphics.drawRect(0, 0, 615, 768);
			mBackground.graphics.endFill();
			mBackground.mouseEnabled = false;
			addChild(mBackground);
			
			mPathContainer = new Sprite();
			addChild(mPathContainer);
		}
		
		public function Render(aSkillNode:SkillNode):void
		{
			var connectionList:Vector.<SkillNode> = aSkillNode.Connection.NodeList
			
			for (var i:int = 0; i < connectionList.length; i++) 
			{
				mPathContainer.graphics.lineStyle(2, 0x000000);
				mPathContainer.graphics.moveTo(aSkillNode.Position.x + mScrollOffset.x, aSkillNode.Position.y + mScrollOffset.y);
				mPathContainer.graphics.lineTo(connectionList[i].Position.x + mScrollOffset.x, connectionList[i].Position.y + mScrollOffset.y);
			}
			aSkillNode.x = aSkillNode.Position.x + mScrollOffset.x;
			aSkillNode.y = aSkillNode.Position.y + mScrollOffset.y;
			addChild(aSkillNode);
		}
		
		override public function Update():void 
		{
			mPathContainer.graphics.clear();
			
			super.Update();
		}
		
		public function SetOffset(aScrollOffset:Point):void 
		{
			mScrollOffset = aScrollOffset;
		}
	}

}