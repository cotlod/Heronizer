package combat 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author 
	 */
	public class PlayerAsset 
	{
		static public var IDLE:String = "IDLE";
		static public var STRIKE:String = "STRIKE";
		static public var HIT:String = "HIT";
		static public var DEATH:String = "DEATH";
		
		static public var IDLE_TOAST:String = "IDLE_TOAST";
		static public var STRIKE_TOAST:String = "STRIKE_TOAST";
		
		static public var IDLE_PINCER:String = "IDLE_PINCER";
		static public var STRIKE_PINCER:String = "STRIKE_PINCER";
		
		static public var IDLE_FIRE:String = "IDLE_FIRE";
		static public var STRIKE_FIRE:String = "STRIKE_FIRE";
		
		static public var IDLE_MEGA_DICK:String = "IDLE_MEGA_DICK";
		static public var STRIKE_MEGA_DICK:String = "STRIKE_MEGA_DICK";
		
		static public var IDLE_ROID_UP:String = "IDLE_ROID_UP";
		static public var STRIKE_ROID_UP:String = "STRIKE_ROID_UP";
		
		static public var IDLE_MIDGET:String = "IDLE_MIDGET";
		static public var STRIKE_MIDGET:String = "STRIKE_MIDGET";
		
		static public var IDLE_HEALER:String = "IDLE_HEALER";
		static public var STRIKE_HEALER:String = "STRIKE_HEALER";
		
		static public var DEATH_DEALER_IDLE:String = "DEATH_DEALER_IDLE";
		
		static public var AssetDictionary:Dictionary = new Dictionary();
		
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
		
		[Embed(source="../../bin/assets/Heros_Idle_Toast.png")]
		private var mPlayerToastIdleClass:Class;
		private var mPlayerToastIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike_Toast.png")]
		private var mPlayerToastStrikeClass:Class;
		private var mPlayerToastStrikeVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_Pincer.png")]
		private var mPlayerPincerIdleClass:Class;
		private var mPlayerPincerIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike_Pincer.png")]
		private var mPlayerPincerStrikeClass:Class;
		private var mPlayerPincerStrikeVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_FlameOn.png")]
		private var mPlayerFireIdleClass:Class;
		private var mPlayerFireIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike_FlameOn.png")]
		private var mPlayerFireStrikeClass:Class;
		private var mPlayerFireStrikeVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_Deathdealer.png")]
		private var mPlayerDeathDealerIdleClass:Class;
		private var mPlayerDeathDealerIdleVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_MegaDick.png")]
		private var mPlayerMegaDickIdleClass:Class;
		private var mPlayerMegaDickIdleVisual:Bitmap;
		[Embed(source = "../../bin/assets/Heros_Strike_MegaDick.png")]
		private var mPlayerMegaDickStrikeClass:Class;
		private var mPlayerMegaDickStrikeVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_RoidUp.png")]
		private var mPlayerRoidUpIdleClass:Class;
		private var mPlayerRoidUpIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike_RoidUp.png")]
		private var mPlayerRoidUpStrikeClass:Class;
		private var mPlayerRoidUpStrikeVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_Midget.png")]
		private var mPlayerMidgetIdleClass:Class;
		private var mPlayerMidgetIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike_Midget.png")]
		private var mPlayerMidgetStrikeClass:Class;
		private var mPlayerMidgetStrikeVisual:Bitmap;
		
		[Embed(source="../../bin/assets/Heros_Idle_Healer.png")]
		private var mPlayerHealerIdleClass:Class;
		private var mPlayerHealerIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Heros_Strike_Healer.png")]
		private var mPlayerHealerStrikeClass:Class;
		private var mPlayerHealerStrikeVisual:Bitmap;
		
		public function PlayerAsset() 
		{			
			mPlayerIdleVisual = new mPlayerIdleClass();
			mPlayerAttackVisual = new mPlayerAttackClass();
			mPlayerHitVisual = new mPlayerHitClass();
			mPlayerDeadVisual = new mPlayerDeadClass();
			
			mPlayerToastIdleVisual = new mPlayerToastIdleClass();
			mPlayerToastStrikeVisual = new mPlayerToastStrikeClass();
			
			mPlayerPincerIdleVisual = new mPlayerPincerIdleClass();
			mPlayerPincerStrikeVisual = new mPlayerPincerStrikeClass();
			
			mPlayerFireIdleVisual = new mPlayerFireIdleClass();
			mPlayerFireStrikeVisual = new mPlayerFireStrikeClass();
			
			mPlayerMegaDickIdleVisual = new mPlayerMegaDickIdleClass();
			mPlayerMegaDickStrikeVisual = new mPlayerMegaDickStrikeClass();
			
			mPlayerRoidUpIdleVisual = new mPlayerRoidUpIdleClass();
			mPlayerRoidUpStrikeVisual = new mPlayerRoidUpStrikeClass();
			
			mPlayerMidgetIdleVisual = new mPlayerMidgetIdleClass();
			mPlayerMidgetStrikeVisual = new mPlayerMidgetStrikeClass();
			
			mPlayerHealerIdleVisual = new mPlayerHealerIdleClass();
			mPlayerHealerStrikeVisual = new mPlayerHealerStrikeClass();
			
			mPlayerDeathDealerIdleVisual = new mPlayerDeathDealerIdleClass();
			
			AssetDictionary[IDLE] = mPlayerIdleVisual;
			AssetDictionary[STRIKE] = mPlayerAttackVisual;
			AssetDictionary[HIT] = mPlayerHitVisual;
			AssetDictionary[DEATH] = mPlayerDeadVisual;
			
			AssetDictionary[IDLE_TOAST] = mPlayerToastIdleVisual;
			AssetDictionary[STRIKE_TOAST] = mPlayerToastStrikeVisual;
			
			AssetDictionary[IDLE_PINCER] = mPlayerPincerIdleVisual;
			AssetDictionary[STRIKE_PINCER] = mPlayerPincerStrikeVisual;
			
			AssetDictionary[IDLE_FIRE] = mPlayerFireIdleVisual;
			AssetDictionary[STRIKE_FIRE] = mPlayerFireStrikeVisual;
			
			AssetDictionary[IDLE_MEGA_DICK] = mPlayerMegaDickIdleVisual;
			AssetDictionary[STRIKE_MEGA_DICK] = mPlayerMegaDickStrikeVisual;
			
			AssetDictionary[IDLE_ROID_UP] = mPlayerRoidUpIdleVisual;
			AssetDictionary[STRIKE_ROID_UP] = mPlayerRoidUpStrikeVisual;
			
			AssetDictionary[IDLE_MIDGET] = mPlayerMidgetIdleVisual;
			AssetDictionary[STRIKE_MIDGET] = mPlayerMidgetStrikeVisual;
			
			AssetDictionary[IDLE_HEALER] = mPlayerHealerIdleVisual;
			AssetDictionary[STRIKE_HEALER] = mPlayerHealerStrikeVisual;
			
			AssetDictionary[DEATH_DEALER_IDLE] = mPlayerDeathDealerIdleVisual;
		}
		
	}

}