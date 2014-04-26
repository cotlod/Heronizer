package combat 
{
	import combat.event.CharacterEvent;
	import flash.display.Bitmap;
	import util.GameTime;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Player extends BaseCharacter 
	{
		[Embed(source="../../bin/assets/Heros_Idle.png")]
		private var mPlayerIdleClass:Class;
		private var mPlayerIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike.png")]
		private var mPlayerAttackClass:Class;
		private var mPlayerAttackVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Hit.png")]
		private var mPlayerHitClass:Class;
		private var mPlayerHitVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Death.png")]
		private var mPlayerDeadClass:Class;
		private var mPlayerDeadVisual:Bitmap;
		private var mSkillTimer:Number = 0;
		
		public function Player() 
		{
			super();
			mCharacterStat.AddStat(new Stat(1, 0, EStat.XP_MODIFIER));
			Name = "Player";
			mPlayerIdleVisual = new mPlayerIdleClass();
			mPlayerAttackVisual = new mPlayerAttackClass();
			mPlayerHitVisual = new mPlayerHitClass();
			mPlayerDeadVisual = new mPlayerDeadClass();
			mView.addChild(mPlayerIdleVisual);
			mView.y = OffsetValues.STAGE_HEIGHT - mView.height;
			//mView.width = 100;
		}
		
		override public function SetState(aState:int):void 
		{
			super.SetState(aState);
			
			if (mView.numChildren > 0)
			{
				mView.removeChildAt(0);
			}
			
			switch(aState)
			{
				case EState.IDLE:
				{
					trace("SetState IDLE");
					mView.addChild(mPlayerIdleVisual);
					break;
				}
				case EState.ATTACK:
				{
					trace("SetState ATTACK");
					mView.addChild(mPlayerAttackVisual);
					break;
				}
				case EState.HIT:
				{
					trace("SetState HIT");
					mView.addChild(mPlayerHitVisual);
					break;
				}
				case EState.DEAD:
				{
					trace("SetState DEAD");
					mView.addChild(mPlayerDeadVisual);
					break;
				}
			}
		}
		
		override public function Update():void 
		{
			super.Update();
		}


	}

}