package skill 
{
	import combat.Skill;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
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
		
		private var mDebug:Boolean;
		private var mMove:Boolean;
		
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
			
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_DOWN, OnScrollMouseDown, true);
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			mSkillTreeView.addEventListener(MouseEvent.CLICK, OnSkillTreeClick);
			
			Stage2D.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			
			Stage2D.addEventListener(KeyboardEvent.KEY_UP, OnKeyUp);
		}
		
		private function OnKeyUp(aEvent:KeyboardEvent):void 
		{
			if (aEvent.keyCode == Keyboard.SPACE)
			{
				mDebug = !mDebug;
			}
			
			if (aEvent.keyCode == Keyboard.M)
			{
				mMove = !mMove;
			}
		}
		
		private function OnSkillTreeClick(aEvent:MouseEvent):void 
		{
			if (mDebug && !mMove)
			{
				mCurrentNode = new SkillNode();
				mCurrentNode.Position.x = mSkillTreeView.mouseX - mScrollOffset.x;
				mCurrentNode.Position.y = mSkillTreeView.mouseY - mScrollOffset.y;
				mCurrentNode.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
				mCurrentNode.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
				mSkillTreeModel.AddNode(mCurrentNode);
			}
		}
		
		private function OnScrollMouseDown(aEvent:MouseEvent):void 
		{
			aEvent.stopPropagation();
			
			if (mDebug) { return; }
			
			mLastMousePosition.x = mSkillTreeView.mouseX;
			mLastMousePosition.y = mSkillTreeView.mouseY;
			
			mScroll = true;
		}
		
		private function OnMouseDown(aEvent:MouseEvent):void 
		{
			aEvent.stopPropagation();
			
			if (mDebug)
			{
				mCurrentNode = aEvent.target as SkillNode;
			}
		}
		
		private function OnMouseUp(aEvent:MouseEvent):void 
		{
			aEvent.stopPropagation();
			
			mScroll = false;
			
			if (mDebug)
			{
				if (!mMove && mCurrentNode && aEvent.target is SkillNode)
				{
					mCurrentNode.Connection.AddNode(aEvent.target as SkillNode);
				}
				
				if (mMove)
				{
					mCurrentNode = null;
				}
			}
		}
		
		override public function Update():void 
		{
			super.Update();
			
			if (mScroll)
			{
				mScrollOffset.x -= mLastMousePosition.x - mSkillTreeView.mouseX;
				mScrollOffset.y -= mLastMousePosition.y - mSkillTreeView.mouseY;
				
				mLastMousePosition.x = mSkillTreeView.mouseX;
				mLastMousePosition.y = mSkillTreeView.mouseY;
			}
			
			if (mDebug && mMove)
			{
				if (mCurrentNode)
				{
					mCurrentNode.Position.x = mSkillTreeView.mouseX - mScrollOffset.x;
					mCurrentNode.Position.y = mSkillTreeView.mouseY - mScrollOffset.y;
				}	
			}
			
			mSkillTreeView.SetOffset(mScrollOffset);
			
			mSkillTreeView.Update();
			
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				mSkillTreeModel.SkillNodeList[i].Update();
				mSkillTreeView.Render(mSkillTreeModel.SkillNodeList[i]);
			}
		}
	}
}