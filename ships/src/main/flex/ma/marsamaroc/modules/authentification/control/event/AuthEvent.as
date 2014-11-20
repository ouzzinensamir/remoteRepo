package ma.marsamaroc.modules.authentification.control.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class AuthEvent extends CairngormEvent
	{
		public static const AUTHENTIF :String ="authentification";
		public static const LOAD :String ="load";
		public function AuthEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}