package combat 
{
	import flash.display.Bitmap;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends BaseCharacter 
	{
		[Embed(source="../../bin/assets/Vilain01_Idle.png")]
		private var mEnemyIdleClass:Class;
		private var mEnemyIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Vilain01_Strike.png")]
		private var mEnemyAttackClass:Class;
		private var mEnemyAttackVisual:Bitmap;
		[Embed(source="../../bin/assets/Vilain01_Hit.png")]
		private var mEnemyHitClass:Class;
		private var mEnemyHitVisual:Bitmap;
		[Embed(source="../../bin/assets/Vilain01_Death.png")]
		private var mEnemyDeadClass:Class;
		private var mEnemyDeadVisual:Bitmap;
		
		public function Enemy() 
		{
			super();
			Name = "Enemy";
			mEnemyIdleVisual = new mEnemyIdleClass();
			mEnemyAttackVisual = new mEnemyAttackClass();
			mEnemyDeadVisual = new mEnemyDeadClass();
			mEnemyHitVisual = new mEnemyHitClass();
			mView.addChild(mEnemyIdleVisual);
			//mView.width = 100;
			mView.x = OffsetValues.COMBAT_VIEW_WIDTH - mView.width;
			mView.y = OffsetValues.STAGE_HEIGHT - mView.height;
		}
		
		override public function SetState(aState:int):void 
		{
			super.SetState(aState);
			mView.removeChildAt(0);
			switch(aState)
			{
				case EState.IDLE:
				{
					mView.addChild(mEnemyIdleVisual);
					break;
				}
				case EState.ATTACK:
				{
					mView.addChild(mEnemyAttackVisual);
					break;
				}
				case EState.HIT:
				{
					mView.addChild(mEnemyHitVisual);
					break;
				}
				case EState.DEAD:
				{
					mView.addChild(mEnemyDeadVisual);
					break;
				}
			}
		}
		
	}

}