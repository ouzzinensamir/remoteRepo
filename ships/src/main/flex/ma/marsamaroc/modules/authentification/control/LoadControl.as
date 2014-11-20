package ma.marsamaroc.modules.authentification.control
{

	
	import com.adobe.cairngorm.control.FrontController;
	
	import ma.marsamaroc.modules.authentification.control.command.LoadCommand;
	import ma.marsamaroc.modules.authentification.control.event.LoadEvent;

	public class LoadControl extends FrontController
	{
		public function LoadControl() 
		{
			super();
			addCommand(LoadEvent.LOAD_INFO,LoadCommand);
		}
	}
}