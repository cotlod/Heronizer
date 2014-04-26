package combat 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Stat 
	{
		public var Value:Number;
		public var Modifier:Number;
		public var Type:EStat;
		
		public function Stat(aValue:Number, aModifier:Number, aType:EStat) 
		{
			Value = aValue;
			Modifier = aModifier;
			Type = aType;
		}
		
	}

}