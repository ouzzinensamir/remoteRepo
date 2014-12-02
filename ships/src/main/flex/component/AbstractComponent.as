package component
{
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	
	[Bindable]
	public class  AbstractComponent extends UIComponent
	{
		protected var x1:int;
		protected var y1:int;
		public function drawComponentIn(terminal:PanZoomContent):void{
			this.addEventListener(DragEvent.DRAG_ENTER,dragEnterHandler);
			this.addEventListener(DragEvent.DRAG_EXIT,dragExitHandler);
			//this.addEventListener(DragEvent.DRAG_DROP,(terminal.parentApplication as ships).dragDropHandler);
		}
		// Called when the user moves the drag indicator onto the drop target.
		public function dragEnterHandler(event:DragEvent):void {
			trace("remove");
			//FlexGlobals.topLevelApplication.panzoom.removeEventListener(DragEvent.DRAG_DROP,FlexGlobals.topLevelApplication.dragDropHandler);
		}
	
		
		public function dragExitHandler(event:DragEvent):void {
			//FlexGlobals.topLevelApplication.panzoom.addEventListener(DragEvent.DRAG_DROP,FlexGlobals.topLevelApplication.dragDropHandler);
			trace("exit remve");
		}
	}
}