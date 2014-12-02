package popups
{
	import component.passifs.Rectangle;
	import component.passifs.Trapezoidal;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;

	public class TrapezoidalPopup extends GenericPopup
	{
		public function TrapezoidalPopup(definedX:int,definedY:int)
		{
			this.definedX=definedX;
			this.definedY=definedY;
			super();
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.TRAPEZOIDAL;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var trapezoidal:Trapezoidal=new Trapezoidal(Number(x1Value.text),Number(y1Value.text),
				Number(widthComp.text),Number(heightComp.text),deviation.selectedItem as String);
			trapezoidal.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}