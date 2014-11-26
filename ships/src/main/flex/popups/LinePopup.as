package popups
{
	import component.passifs.DegradedLine;
	import component.passifs.TypesPassifComponent;
	
	import flash.events.MouseEvent;

	public class LinePopup extends GenericPopup
	{
		
		public function LinePopup(definedX:int,definedY:int)
		{
			this.definedX=definedX;
			this.definedY=definedY;
			super();
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.LINE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var line:DegradedLine=new DegradedLine(Number(x1Value.text),Number(y1Value.text),Number(x2Value.text),Number(y2Value.text));
			line.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}