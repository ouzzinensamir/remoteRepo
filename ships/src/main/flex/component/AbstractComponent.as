package component
{
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	
	
	[Bindable]
	public class  AbstractComponent extends UIComponent
	{
		public var x1:int;
		public var y1:int;
		
		public function drawComponentIn(terminal:PanZoomContent):void{
			
		}
		
		public function createPopup():GenericPopup {
			return new GenericPopup();
		}
		
		public function updateCoordinates(newX:int,newY:int):void{
			this.x1=this.x1+newX;
			this.y1=this.y1+newY;
		}
	}
}