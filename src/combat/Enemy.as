package combat 
{
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends BaseCharacter 
	{
		[Embed(source="../../bin/assets/joffrey_idle.jpg")]
		private var mEnemyIdleClass:Class;
		private var mEnemyIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/joffrey_attack.jpg")]
		private var mEnemyAttackClass:Class;
		private var mEnemyAttackVisual:Bitmap;
		[Embed(source="../../bin/assets/joffrey_hit.jpg")]
		private var mEnemyHitClass:Class;
		private var mEnemyHitVisual:Bitmap;
		[Embed(source="../../bin/assets/joffrey_dead.jpg")]
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
			mView.width = 100;
			mView.x = 300;
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