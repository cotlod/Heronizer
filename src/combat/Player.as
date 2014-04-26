package combat 
{
	import combat.event.CharacterEvent;
	import flash.display.Bitmap;
	import util.GameTime;
	/**
	 * ...
	 * @author 
	 */
	public class Player extends BaseCharacter 
	{
		[Embed(source="../../bin/assets/superman_idle.gif")]
		private var mPlayerIdleClass:Class;
		private var mPlayerIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/superman_attack.gif")]
		private var mPlayerAttackClass:Class;
		private var mPlayerAttackVisual:Bitmap;
		[Embed(source="../../bin/assets/superman_hit.gif")]
		private var mPlayerHitClass:Class;
		private var mPlayerHitVisual:Bitmap;
		[Embed(source="../../bin/assets/superman_dead.gif")]
		private var mPlayerDeadClass:Class;
		private var mPlayerDeadVisual:Bitmap;
		private var mSkillTimer:Number = 0;
		
		public var XpModifier:Stat = new Stat(1, 0, EStat.XP_MODIFIER);
		
		public function Player() 
		{
			super();
			Speed.Value -= 2;
			Name = "Player";
			mPlayerIdleVisual = new mPlayerIdleClass();
			mPlayerAttackVisual = new mPlayerAttackClass();
			mPlayerHitVisual = new mPlayerHitClass();
			mPlayerDeadVisual = new mPlayerDeadClass();
			mView.addChild(mPlayerIdleVisual);
			mView.width = 100;
		}
		
		override public function SetState(aState:int):void 
		{
			super.SetState(aState);
			mView.removeChildAt(0);
			switch(aState)
			{
				case EState.IDLE:
				{
					mView.addChild(mPlayerIdleVisual);
					break;
				}
				case EState.ATTACK:
				{
					mView.addChild(mPlayerAttackVisual);
					break;
				}
				case EState.HIT:
				{
					mView.addChild(mPlayerHitVisual);
					break;
				}
				case EState.DEAD:
				{
					mView.addChild(mPlayerDeadVisual);
					break;
				}
			}
		}
		
		override public function Update():void 
		{
			mSkillTimer += GameTime.DeltaTime;
			dispatchEvent(new CharacterEvent(CharacterEvent.SKILL_COOLDOWN_UPDATE, mSkillTimer / SkillDuration.Value));
			if (mSkillTimer >= SkillDuration.Value)
			{
				dispatchEvent(new CharacterEvent(CharacterEvent.CHANGED_SKILL));
				mSkillTimer = mSkillTimer - SkillDuration.Value;
			}
			super.Update();
		}
	}

}