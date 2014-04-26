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
		public function Hud() 
		{
			mPlayerHealthBar = new HealthBar();
			mEnemyHealthBar = new HealthBar();
			
			addChild(mPlayerHealthBar);
			addChild(mEnemyHealthBar);
			
			mPlayerHealthBar.y = OffsetValues.HEALTH_BARS_Y_OFFSET;
			mEnemyHealthBar.y = OffsetValues.HEALTH_BARS_Y_OFFSET;
			mEnemyHealthBar.x = OffsetValues.COMBAT_VIEW_WIDTH - mEnemyHealthBar.width;
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
	}
}