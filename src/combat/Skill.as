package combat 
{
	import util.IUpdatable;
	/**
	 * ...
	 * @author 
	 */
	public class Skill implements IUpdatable
	{
		private var mType:ESkill;
		
		public function Skill(aType:ESkill) 
		{
			mType = aType;
		}
		
		public function get Type():ESkill { return(mType); }
		
		public function Update():void 
		{
			
		}
	}

}