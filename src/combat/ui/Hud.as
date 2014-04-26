package combat.ui 
{
	import combat.ECharacter;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Hud extends Sprite
	{
		private var mPlayerHealthBar:HealthBar;
		private var mEnemyHealthBar:HealthBar;
		private var mXP:TextField;
		private var mSkillCountdownBar:SkillCountdown;
		public function Hud() 
		{
			mPlayerHealthBar = new HealthBar();
			mEnemyHealthBar = new HealthBar();
			mXP = new TextField();
			mSkillCountdownBar = new SkillCountdown();
			
			mXP = new TextField();
			var tempFormat:TextFormat = new TextFormat("Arial", 16, 0xB200FF, true);
			mXP.text = "0 XP";
			mXP.defaultTextFormat = tempFormat;
			mXP.setTextFormat(tempFormat);
			
			addChild(mPlayerHealthBar);
			addChild(mEnemyHealthBar);
			addChild(mXP);
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
		
		public function AddXP(aValue:Number):void
		{
			mXP.text = aValue.toString() + " XP";
		}
	}
}