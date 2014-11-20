package ma.marsamaroc.modules.authentification.control.delegate
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import main.flex.ma.marsamaroc.service.ServicesConstantes;
	
	import mx.messaging.ChannelSet;
	import mx.messaging.config.ServerConfig;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	public class LoadDelegate
	{
			protected var responder 	: IResponder;
			protected var service 		: Object;	
			
			public function LoadDelegate( responder : IResponder = null )
			{	
				this.responder = responder;
			}
			
			
			public function loadInfo() : void
			{
				this.service = ServiceLocator.getInstance().getService(ServicesConstantes.WELCOME_SERVICE);
				this.service.channelSet = new ChannelSet();
				this.service.channelSet.addChannel(ServerConfig.getChannel("spring-amf"));
				var token:AsyncToken = service.loadInfo();
				token.addResponder(responder);
				
			}	
	}
}