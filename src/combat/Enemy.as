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
		private var mEnemyIdle1Class:Class;
		private var mEnemyIdle1Visual:Bitmap;
		[Embed(source="../../bin/assets/Vilain01_Strike.png")]
		private var mEnemyAttack1Class:Class;
		private var mEnemyAttack1Visual:Bitmap;
		[Embed(source="../../bin/assets/Vilain01_Hit.png")]
		private var mEnemyHit1Class:Class;
		private var mEnemyHit1Visual:Bitmap;
		[Embed(source="../../bin/assets/Vilain01_Death.png")]
		private var mEnemyDead1Class:Class;
		private var mEnemyDead1Visual:Bitmap;
		
		[Embed(source="../../bin/assets/Vilain02_Idle.png")]
		private var mEnemyIdle2Class:Class;
		private var mEnemyIdle2Visual:Bitmap;
		[Embed(source="../../bin/assets/Vilain02_Strike.png")]
		private var mEnemyAttack2Class:Class;
		private var mEnemyAttack2Visual:Bitmap;
		[Embed(source="../../bin/assets/Vilain02_Hit.png")]
		private var mEnemyHit2Class:Class;
		private var mEnemyHit2Visual:Bitmap;
		[Embed(source="../../bin/assets/Vilain02_Death.png")]
		private var mEnemyDead2Class:Class;
		private var mEnemyDead2Visual:Bitmap;
		
		public function Enemy() 
		{
			super();
			Name = "Enemy";
			mEnemyIdle1Visual = new mEnemyIdle1Class();
			mEnemyAttack1Visual = new mEnemyAttack1Class();
			mEnemyDead1Visual = new mEnemyDead1Class();
			mEnemyHit1Visual = new mEnemyHit1Class();
			
			mEnemyIdle2Visual = new mEnemyIdle2Class();
			mEnemyAttack2Visual = new mEnemyAttack2Class();
			mEnemyDead2Visual = new mEnemyDead2Class();
			mEnemyHit2Visual = new mEnemyHit2Class();
			
			mView.addChild(mEnemyIdle1Visual);
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
					mView.addChild(mEnemyIdle1Visual);
					break;
				}
				case EState.ATTACK:
				{
					mView.addChild(mEnemyAttack1Visual);
					break;
				}
				case EState.HIT:
				{
					mView.addChild(mEnemyHit1Visual);
					break;
				}
				case EState.DEAD:
				{
					mView.addChild(mEnemyDead1Visual);
					break;
				}
			}
		}
		
	}

}