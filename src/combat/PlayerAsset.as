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
		
		public function PlayerAsset() 
		{			
			mPlayerIdleVisual = new mPlayerIdleClass();
			mPlayerAttackVisual = new mPlayerAttackClass();
			mPlayerHitVisual = new mPlayerHitClass();
			mPlayerDeadVisual = new mPlayerDeadClass();
			mPlayerToastIdleVisual = new mPlayerToastIdleClass();
			mPlayerToastStrikeVisual = new mPlayerToastStrikeClass();
			
			AssetDictionary[IDLE] = mPlayerIdleVisual
			AssetDictionary[STRIKE] = mPlayerAttackVisual
			AssetDictionary[HIT] = mPlayerHitVisual
			AssetDictionary[DEATH] = mPlayerDeadVisual
			AssetDictionary[IDLE_TOAST] = mPlayerToastIdleVisual
			AssetDictionary[STRIKE_TOAST] = mPlayerToastStrikeVisual
		}
		
	}

}