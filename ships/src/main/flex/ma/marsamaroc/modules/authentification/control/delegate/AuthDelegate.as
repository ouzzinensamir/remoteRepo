package ma.marsamaroc.modules.authentification.control.delegate
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import main.flex.ma.marsamaroc.service.ServicesConstantes;
	
	import mx.controls.Alert;
	import mx.messaging.ChannelSet;
	import mx.messaging.config.ServerConfig;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class AuthDelegate
	{
			protected var responder 	: IResponder;
			protected var service 		: Object;	
			
			public function AuthDelegate( responder : IResponder = null )
			{	
				this.responder = responder;
			}
			
			public function authenticateUser(login:String,password:String) : void
			{
				this.service = ServiceLocator.getInstance().getService(ServicesConstantes.WELCOME_SERVICE);
				this.service.channelSet = new ChannelSet();
				this.service.channelSet.addChannel(ServerConfig.getChannel("local-amf"));
				var token:AsyncToken = service.authenticateUser(login,password);
				token.addResponder(responder);
			}	
	}
}