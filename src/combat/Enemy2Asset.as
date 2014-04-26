package combat 
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author 
	 */
	public class Enemy2Asset 
	{
		static public var IDLE:String = "IDLE";
		static public var STRIKE:String = "STRIKE";
		static public var HIT:String = "HIT";
		static public var DEATH:String = "DEATH";
		
		static public var AssetDictionary:Dictionary;
		
		[Embed(source="../../bin/assets/Vilain02_Idle.png")]
		private var mEnemyIdleClass:Class;
		private var mEnemyIdleVisual:Bitmap;
		[Embed(source="../../bin/assets/Vilain02_Strike.png")]
		private var mEnemyAttackClass:Class;
		private var mEnemyAttackVisual:Bitmap;
		[Embed(source="../../bin/assets/Vilain02_Hit.png")]
		private var mEnemyHitClass:Class;
		private var mEnemyHitVisual:Bitmap;
		[Embed(source="../../bin/assets/Vilain02_Death.png")]
		private var mEnemyDeadClass:Class;
		private var mEnemyDeadVisual:Bitmap;
		
		public function Enemy2Asset() 
		{
			AssetDictionary = new Dictionary();
			
			mEnemyIdleVisual = new mEnemyIdleClass();
			mEnemyAttackVisual = new mEnemyAttackClass();
			mEnemyHitVisual = new mEnemyHitClass();
			mEnemyDeadVisual = new mEnemyDeadClass();
			
			AssetDictionary[IDLE] = mEnemyIdleVisual
			AssetDictionary[STRIKE] = mEnemyAttackVisual
			AssetDictionary[HIT] = mEnemyHitVisual
			AssetDictionary[DEATH] = mEnemyDeadVisual
		}
	}

}