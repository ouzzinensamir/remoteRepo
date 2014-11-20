package ma.marsamaroc.exception
{
	import mx.collections.ArrayCollection;
	import mx.resources.ResourceManager;
	
	[ResourceBundle("message")]
	
	public class CodeConverter
	{
		public static function getMessage(code:String, params:ArrayCollection = null):String
		{
			
			return ResourceManager.getInstance().getString("message", code, params ? params.toArray() : null);
		}
	}
}