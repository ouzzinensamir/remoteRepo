package popups
{
	import component.passifs.Rectangle;
	import component.passifs.TypesPassifComponent;
	
	import flash.events.MouseEvent;

	public class RectPopup extends GenericPopup
	{
		public function RectPopup(definedX:int,definedY:int)
		{
			this.definedX=definedX;
			this.definedY=definedY;
			super();
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.RECTANGLE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var rectangle:Rectangle=new Rectangle(Number(x1Value.text),Number(y1Value.text),
				Number(widthComp.text),Number(heightComp.text),orientation.selectedItem as String);
			rectangle.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}