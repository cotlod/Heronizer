package combat 
{
	/**
	 * ...
	 * @author 
	 */
	public class Skill 
	{
		private var mType:ESkill;
		
		public function Skill(aType:ESkill) 
		{
			mType = aType;
		}
		
		public function get Type():ESkill { return(mType); }
	}

}