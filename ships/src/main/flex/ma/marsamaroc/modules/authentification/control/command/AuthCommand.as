package ma.marsamaroc.modules.authentification.control.command
{
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import ma.marsamaroc.modules.authentification.control.delegate.AuthDelegate;
	import ma.marsamaroc.modules.authentification.control.event.AuthEvent;
	import ma.marsamaroc.modules.authentification.model.AuthModel;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	
	public class AuthCommand implements Command
	{

		[Bindable]
		public var model:AuthModel=AuthModel.getInstance();
		public function execute( event : CairngormEvent ):void 
		{	
			
			switch(event.type)
			{
				case AuthEvent.AUTHENTIF:
					var responder:Responder = new Responder(onAuthentification, onFault);
					var delegate:AuthDelegate = new AuthDelegate(responder);
					var collection:ArrayCollection=new ArrayCollection();
					delegate.authenticateUser(model.login,model.password);
					break;	
			}
		}

		
		
		
		public function onAuthentification(info:ResultEvent):void{
			try
			{
				
				var resultat:String=info.result as String;
				if(resultat =="oui")
				{
					Alert.show("Oui");
				}
				else
				{
					Alert.show("Veuillez resaisir le login et le mot de passe","Server Information"+model.login);
				}
			}
			catch (error:Error)
	 		{
				 			
	 		}
		}
 
		public function onFault(info:FaultEvent):void
		{			
			Alert.show(info.fault.faultString, "ERROR");
		}	
						
	}
}