package combat.ui 
{
	import combat.ECharacter;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import util.OffsetValues;
	/**
	 * ...
	 * @author 
	 */
	public class Hud extends Sprite
	{
		[Embed(source="../../../bin/assets/UI_Frame_01.png")]
		private var mUIFrame01Class:Class;
		private var mUIFrame01:Bitmap;
		[Embed(source="../../../bin/assets/UI_Frame_02.png")]
		private var mUIFrame02Class:Class;
		private var mUIFrame02:Bitmap;
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
			mUIFrame01 = new mUIFrame01Class();
			mUIFrame02 = new mUIFrame02Class();
			
			mXP = new TextField();
			var tempFormat:TextFormat = new TextFormat("Helvetica", 20, 0xFFFFFF, true);
			mXP.text = "0";
			mXP.defaultTextFormat = tempFormat;
			mXP.setTextFormat(tempFormat);
			mXP.filters = [new GlowFilter(0x000000)];
			
			addChild(mUIFrame01);
			addChild(mUIFrame02);
			addChild(mPlayerHealthBar);
			addChild(mEnemyHealthBar);
			addChild(mXP);
			addChild(mSkillCountdownBar);
			
			mXP.x = OffsetValues.XP_TEXTFIELD_X_OFFSET;
			mXP.y = OffsetValues.XP_TEXTFIELD_Y_OFFSET;
			mPlayerHealthBar.y = OffsetValues.HEALTH_BARS_Y_OFFSET;
			mEnemyHealthBar.y = OffsetValues.HEALTH_BARS_Y_OFFSET;
			mEnemyHealthBar.x = OffsetValues.COMBAT_VIEW_WIDTH - mEnemyHealthBar.width;
			mSkillCountdownBar.x = OffsetValues.COMBAT_VIEW_WIDTH / 2;
			mUIFrame02.x = 463;
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
			mXP.text = aValue.toString();
		}
	}
}