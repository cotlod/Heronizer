package skill 
{
	import mvc.BaseController;
	/**
	 * ...
	 * @author 
	 */
	public class SkillTreeController extends BaseController
	{
		
		public function SkillTreeController() 
		{
			mView = new SkillTreeView();
			mModel = new SkillTreeModel();
		}
		
		
	}

}