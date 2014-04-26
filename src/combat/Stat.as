package combat 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Stat 
	{
		public var OriginalValue:Number;
		public var Value:Number;
		public var Modifier:Number;
		public var Type:EStat;
		
		public function Stat(aValue:Number, aModifier:Number, aType:EStat) 
		{
			OriginalValue = aValue;
			Value = aValue;
			Modifier = aModifier;
			Type = aType;
		}
		
	}

}