package skill 
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import mvc.BaseController;
	import util.Stage2D;
	/**
	 * ...
	 * @author 
	 */
	public class SkillTreeController extends BaseController
	{
		private var mSkillTreeView:SkillTreeView;
		private var mSkillTreeModel:SkillTreeModel;
		
		private var mCurrentNode:SkillNode;
		
		private var mScroll:Boolean;
		
		private var mScrollOffset:Point;
		private var mLastMousePosition:Point;
		
		public function SkillTreeController() 
		{
			mView = new SkillTreeView();
			mSkillTreeView = mView as SkillTreeView;
			mModel = new SkillTreeModel();
			mSkillTreeModel = mModel as SkillTreeModel;
			
			mScrollOffset = new Point();
			mLastMousePosition = new Point();
			
			mSkillTreeModel.FromJSON("");
			
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				mSkillTreeModel.SkillNodeList[i].addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
				mSkillTreeModel.SkillNodeList[i].addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			}
			
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_DOWN, OnViewMouseDown);
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_UP, OnViewMouseUp);
			
			Stage2D.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
		}
		
		private function OnViewMouseUp(aEvent:MouseEvent):void 
		{
			
			mScroll = false;
		}
		
		private function OnViewMouseDown(aEvent:MouseEvent):void 
		{
			mLastMousePosition.x = Stage2D.mouseX;
			mLastMousePosition.y = Stage2D.mouseY;
			
			mScroll = true;
		}
		
		private function OnMouseDown(aEvent:MouseEvent):void 
		{
			aEvent.stopPropagation();
			mCurrentNode = aEvent.target as SkillNode;
		}
		
		private function OnMouseUp(aEvent:MouseEvent):void 
		{
			mCurrentNode = null;
		}
		
		override public function Update():void 
		{
			super.Update();
			
			if (mScroll)
			{
				mScrollOffset.x += mLastMousePosition.x - Stage2D.mouseX;
				mScrollOffset.y += mLastMousePosition.y - Stage2D.mouseY;
				
				mLastMousePosition.x = Stage2D.mouseX;
				mLastMousePosition.y = Stage2D.mouseY;
			}
			
			if (mCurrentNode)
			{
				mCurrentNode.Position.x = Stage2D.mouseX;
				mCurrentNode.Position.y = Stage2D.mouseY;
			}
			
			mSkillTreeView.x = mScrollOffset.x;
			mSkillTreeView.y = mScrollOffset.y;
			
			mSkillTreeView.Update();
			
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				mSkillTreeModel.SkillNodeList[i].Update();
				mSkillTreeView.Render(mSkillTreeModel.SkillNodeList[i]);
			}
		}
	}
}