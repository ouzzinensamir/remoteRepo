package popups
{
	import component.passifs.DegradedLine;
	import component.passifs.PointComp;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;

	public class PointPopup extends GenericPopup
	{
		
		public function PointPopup(definedX:int,definedY:int)
		{
			this.definedX=definedX;
			this.definedY=definedY;
			super();
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.POINT;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var pointComp:PointComp=new PointComp(Number(x1Value.text),Number(y1Value.text),Number(raduisValue.text));
			pointComp.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}