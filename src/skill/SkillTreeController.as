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
			
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_DOWN, OnScrollMouseDown);
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
				mCurrentNode = null;
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
				mCurrentNode.addEventListener(MouseEvent.CLICK, OnNodeClick);
				
				mSkillTreeModel.AddNode(mCurrentNode);
			}
		}
		
		private function OnNodeClick(aEvent:MouseEvent):void 
		{
			if (mDebug) { return; }
			var node:SkillNode = aEvent.currentTarget as SkillNode;
			
			if (node == mSkillTreeModel.SkillNodeList[0] || node.Connection.IsAvailable())
			{
				node.Unlocked = !node.Unlocked;
			}
		}
		
		private function OnScrollMouseDown(aEvent:MouseEvent):void 
		{
			//aEvent.stopPropagation();
			
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
				mCurrentNode = aEvent.currentTarget as SkillNode;
			}
		}
		
		private function OnMouseUp(aEvent:MouseEvent):void 
		{
			aEvent.stopPropagation();
			
			mScroll = false;
			
			if (mDebug)
			{
				var connectingNode:SkillNode = aEvent.target as SkillNode;
				
				if (!mMove && mCurrentNode && connectingNode && mCurrentNode != connectingNode)
				{
					mCurrentNode.Connection.AddNode(connectingNode);
					connectingNode.Connection.AddNode(mCurrentNode);
				}
				
				if (mMove)
				{
					mCurrentNode = null;
				}
			}
		}
		
		private function ProcessDebug():void 
		{
			if (!mDebug) { return; }
			
			if (mMove && mCurrentNode)
			{
				mCurrentNode.Position.x = mSkillTreeView.mouseX - mScrollOffset.x;
				mCurrentNode.Position.y = mSkillTreeView.mouseY - mScrollOffset.y;	
			}
		}
		
		private function RenderView():void 
		{
			mSkillTreeView.SetOffset(mScrollOffset);
			
			mSkillTreeView.Update();
			
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				mSkillTreeModel.SkillNodeList[i].Update();
				
				if (!mSkillTreeModel.SkillNodeList[i].Rendered)
				{
					mSkillTreeView.Render(mSkillTreeModel.SkillNodeList[i]);
				}
			}
		}
		
		private function ProcessScrolling():void 
		{
			if (!mScroll) { return; }
			
			mScrollOffset.x -= mLastMousePosition.x - mSkillTreeView.mouseX;
			mScrollOffset.y -= mLastMousePosition.y - mSkillTreeView.mouseY;
			
			mLastMousePosition.x = mSkillTreeView.mouseX;
			mLastMousePosition.y = mSkillTreeView.mouseY;
		}
		
		private function ResetNodeList():void 
		{
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				mSkillTreeModel.SkillNodeList[i].Rendered = false;
			}
		}
		
		override public function Update():void 
		{
			super.Update();
			
			ProcessScrolling();
			
			ProcessDebug();
			
			RenderView();
			
			ResetNodeList();
		}
	}
}