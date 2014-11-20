package ma.marsamaroc.modules.authentification.control.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class LoadEvent extends CairngormEvent
	{
		public static const LOAD_INFO:String ="loadInformation";
		public function LoadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}