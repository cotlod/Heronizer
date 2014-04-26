package mvc 
{
	import util.IUpdatable;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseController implements IUpdatable
	{
		protected var mView:BaseView;
		protected var mModel:BaseModel;
		
		public function BaseController() 
		{
		}
		
		public function get View():BaseView { return(mView); }
		public function get Model():BaseModel { return(mModel); }
		
		public function Update():void
		{
			
		}
	}

}