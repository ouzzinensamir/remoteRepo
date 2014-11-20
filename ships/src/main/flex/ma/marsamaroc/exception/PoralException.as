package ma.marsamaroc.exception
{
	import mx.collections.ArrayCollection;
	
	public class PoralException
	{
		public var code:String;
		public var type:String;
		public var classe:String;
		public var message:String;
		public var stack:String;
		public var params:ArrayCollection;
		public var messages:ArrayCollection;
	}
}