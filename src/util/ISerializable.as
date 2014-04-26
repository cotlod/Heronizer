package util 
{
	/**
	 * ...
	 * @author ...
	 */
	public interface ISerializable 
	{
		function FromJSON(aJSON:String):void;
		function ToJSON():String;
	}

}