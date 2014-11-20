package ma.marsamaroc.modules.authentification.control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import ma.marsamaroc.modules.authentification.control.command.AuthCommand;
	import ma.marsamaroc.modules.authentification.control.event.AuthEvent;

	public class AuthControl extends FrontController
	{
		public function AuthControl() 
		{
			super();
			addCommand(AuthEvent.AUTHENTIF,AuthCommand);
		}
	}
}