package combat 
{
	/**
	 * ...
	 * @author 
	 */
	public class CharacterStat 
	{
		public var mStatList:Vector.<Stat> = new Vector.<Stat>();
		
		public function CharacterStat() 
		{
			
		}
		
		public function AddStat(aStat:Stat):void
		{
			mStatList.push(aStat);
		}
		
		public function GetStatByID(aID:int):Stat
		{
			for (var j:int = 0; j < mStatList.length; j++) 
			{
				if (mStatList[j].Type.ID == aID)
				{
					return(mStatList[j]);
				}
			}
			
			return(null);
		}
		
		public function GetList():Vector.<Stat> { return(mStatList); }
	}

}