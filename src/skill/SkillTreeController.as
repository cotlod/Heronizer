package skill 
{
	import combat.ESkill;
	import combat.EStat;
	import combat.Skill;
	import combat.Stat;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import mvc.BaseController;
	import skill.event.SkillTreeEvent;
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
		
		private var mCurrentXP:int;
		
		private var mUniqueID:int;
		
		private var mURLLoader:URLLoader;
		
		public function SkillTreeController() 
		{
			mView = new SkillTreeView();
			mSkillTreeView = mView as SkillTreeView;
			mModel = new SkillTreeModel();
			mSkillTreeModel = mModel as SkillTreeModel;
			
			mScrollOffset = new Point();
			mLastMousePosition = new Point();
			
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_DOWN, OnScrollMouseDown);
			mSkillTreeView.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			mSkillTreeView.addEventListener(MouseEvent.CLICK, OnSkillTreeClick);
			
			Stage2D.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			Stage2D.addEventListener(KeyboardEvent.KEY_UP, OnKeyUp);
			
			mURLLoader = new URLLoader();
			mURLLoader.addEventListener(Event.COMPLETE, OnSkillTreeLoaded);
			mURLLoader.load(new URLRequest("document.json"));
		}
		
		private function OnSkillTreeLoaded(aEvent:Event):void 
		{
			mURLLoader.removeEventListener(Event.COMPLETE, OnSkillTreeLoaded);
			
			mSkillTreeModel.FromJSON(mURLLoader.data);
			
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				mSkillTreeModel.SkillNodeList[i].addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
				mSkillTreeModel.SkillNodeList[i].addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
				mSkillTreeModel.SkillNodeList[i].addEventListener(MouseEvent.CLICK, OnNodeClick);
			}
			
			mUniqueID = mSkillTreeModel.LastID;
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
			
			if (aEvent.keyCode == Keyboard.S)
			{
				trace(mSkillTreeModel.ToJSON());
			}
		}
		
		private function OnSkillTreeClick(aEvent:MouseEvent):void 
		{
			if (mDebug && !mMove)
			{
				var randomSkill:Skill;
				var randomStat:Stat;
				
				if (Math.random() > 0.9)
				{
					var randomSkillTemplate:ESkill = ESkill.GetList()[int(Math.random() * ESkill.GetList().length)];
					randomSkill = new Skill(randomSkillTemplate);
				}
				else
				{
					var randomStatTemplate:EStat = EStat.GetList()[int(Math.random() * EStat.GetList().length)];
					randomStat = new Stat(int(Math.random() * 5) + 1, 0, randomStatTemplate);
				}
				
				mCurrentNode = new SkillNode(mUniqueID++, randomStat, randomSkill);
				mCurrentNode.XPGate = int(Math.random() * 400);
				mCurrentNode.SetDescription();
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
			var firstNode:SkillNode = mSkillTreeModel.SkillNodeList[0];
			
			if ((node == firstNode || node.Connection.IsAvailable()) && node.XPGate <= mCurrentXP)
			{
				mCurrentXP -= node.XPGate;
				
				node.Unlocked = true;
				
				dispatchEvent(new SkillTreeEvent(SkillTreeEvent.SKILL_CHANGED));
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
		
		public function ComputeSkill():SkillUpdate 
		{
			var skillUpdate:SkillUpdate = new SkillUpdate();
			
			for (var i:int = 0; i < mSkillTreeModel.SkillNodeList.length; i++) 
			{
				if (!mSkillTreeModel.SkillNodeList[i].Unlocked) { continue; }
				
				if (mSkillTreeModel.SkillNodeList[i].NodeStat)
				{
					skillUpdate.StatList.push(mSkillTreeModel.SkillNodeList[i].NodeStat);
				}
				else
				{
					skillUpdate.SkillList.push(mSkillTreeModel.SkillNodeList[i].NodeSkill);
				}
			}
			
			return(skillUpdate);
		}
		
		public function AddXP(aXP:int):void 
		{
			mCurrentXP += aXP
		}
		
		public function GetXP():int 
		{
			return(mCurrentXP);
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