package popups
{
	import component.passifs.Rail;
	import component.passifs.TypesPassifComponent;
	
	import flash.events.MouseEvent;

	public class RailPopup extends GenericPopup
	{
		public function RailPopup(definedX:int,definedY:int)
		{
			this.definedX=definedX;
			this.definedY=definedY;
			super();
		}
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.RAIL;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var rail:Rail=new Rail(Number(x1Value.text),Number(y1Value.text),Number(x2Value.text),Number(y2Value.text));
			rail.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}