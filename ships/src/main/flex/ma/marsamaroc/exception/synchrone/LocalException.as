package ma.marsamaroc.exception.synchrone
{
	public class LocalException extends Error
	{
		public var code:String;
		public var type:String;
		public var messageError:String;
		public var stack:String;		
		
		public function LocalException(code:String, type:String, message:String="", stack:String="")
		{
			this.code = code;
			this.type = type;
			this.messageError = message;
			this.stack = stack;	
		}		
	}
}