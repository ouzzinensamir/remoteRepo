package ma.marsamaroc.modules.authentification.control.command
{

	
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import ma.marsamaroc.modules.authentification.control.delegate.LoadDelegate;
	import ma.marsamaroc.modules.authentification.control.event.LoadEvent;
	import ma.marsamaroc.modules.authentification.model.AuthModel;
	
	import mx.controls.Alert;
	import mx.rpc.Responder;
	
	public class LoadCommand implements Command
	{
		public var model : AuthModel = AuthModel.getInstance();
		public function execute( event : CairngormEvent ):void 
		{	
			
			switch(event.type)
			{
				case LoadEvent.LOAD_INFO :
					var responder:Responder = new Responder(onLoadInf, onFault);
					var delegate:LoadDelegate = new LoadDelegate(responder);
					delegate.loadInfo();
					break;	
			}
		}
		
		public function onLoadInf(info):void{
			try
			{
				
			}
			catch (error:Error)
	 		{
				 	Alert.show("Error");		
	 		}
		}
		public function onFault(info):void
		{		
			var resultat:String=info.result as String;	
			Alert.show(resultat ,'ERROR');
		}	
	}
}