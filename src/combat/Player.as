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
		[Embed(source="../../bin/assets/superman.gif")]
		private var mPlayerClass:Class;
		private var mPlayerVisual:Bitmap;
		private var mSkillTimer:Number = 0;
		
		public var XpModifier:Stat = new Stat(1, 0, EStat.XP_MODIFIER);
		
		public function Player() 
		{
			super();
			Name = "Player";
			mPlayerVisual = new mPlayerClass();
			mView.addChild(mPlayerVisual);
			mView.width = 100;
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