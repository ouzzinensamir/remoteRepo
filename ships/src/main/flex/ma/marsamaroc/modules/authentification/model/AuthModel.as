package ma.marsamaroc.modules.authentification.model
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	[Bindable]
	public class AuthModel implements ModelLocator
	{
		protected static var instance : AuthModel;		
		
		public static function getInstance() : AuthModel
		{ 
			if ( instance == null )
			{ 
				instance = new AuthModel(); 
			}			
			return instance; 
		}                    
		
		public function AuthModel()
		{
			if ( instance != null ) 
			{ 
				throw new Error( "Only one SaisieDSModel instance should be created" );
			} 
			
			login=new String();
			password=new String();
			testArray=new Array();
		}	
		public var login:String;
		public var password:String;
		
		public var resultatAuthentification:String;
		public var hashcode:String;
		
		public var imageString:String;
		public var testArray:Array;
	}
}