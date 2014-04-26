package combat.ui 
{
	import combat.ECharacter;
	import flash.display.Sprite;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Hud extends Sprite
	{
		private var mPlayerHealthBar:HealthBar;
		private var mEnemyHealthBar:HealthBar;
		private var mXPBar:XPBar;
		private var mSkillCountdownBar:SkillCountdown;
		public function Hud() 
		{
			mPlayerHealthBar = new HealthBar();
			mEnemyHealthBar = new HealthBar();
			mXPBar = new XPBar();
			mSkillCountdownBar = new SkillCountdown();
			
			addChild(mPlayerHealthBar);
			addChild(mEnemyHealthBar);
			addChild(mXPBar);
			addChild(mSkillCountdownBar);
			
			mPlayerHealthBar.y = OffsetValues.HEALTH_BARS_Y_OFFSET;
			mEnemyHealthBar.y = OffsetValues.HEALTH_BARS_Y_OFFSET;
			mEnemyHealthBar.x = OffsetValues.COMBAT_VIEW_WIDTH - mEnemyHealthBar.width;
			mSkillCountdownBar.x = OffsetValues.COMBAT_VIEW_WIDTH / 2;
		}
		
		public function SetHealthBar(aCharacterId:int, aRatio:Number):void
		{
			switch(aCharacterId)
			{
				case ECharacter.PLAYER:
				{
					mPlayerHealthBar.SetRatio(aRatio);
					break;
				}
				case ECharacter.ENEMY:
				default:
				{
					mEnemyHealthBar.SetRatio(aRatio);
					break;
				}
			}
		}
		
		public function SetSkillCooldown(aRatio:Number):void
		{
			mSkillCountdownBar.SetRatio(aRatio);
		}
	}
}