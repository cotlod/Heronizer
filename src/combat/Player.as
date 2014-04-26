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
		private var mSkillCooldownTimer:Number = 0;
		
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
			mSkillCooldownTimer += GameTime.DeltaTime;
			if (mSkillCooldownTimer >= SkillCooldown.Value)
			{
				dispatchEvent(new CharacterEvent(CharacterEvent.CHANGED_SKILL));
				mSkillCooldownTimer = mSkillCooldownTimer - SkillCooldown.Value;
			}
			super.Update();
		}
	}

}