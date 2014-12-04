package popups
{
	import component.passifs.Rectangle;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class RectPopup extends GenericPopup
	{
		private var color:uint;
		public function RectPopup(definedX:int=0,definedY:int=0,color:uint=0,rectangle:Rectangle=null)
		{
			super();
			if(rectangle==null){
				this.definedX=definedX;
				this.definedY=definedY;
				this.color=color;
			}else{
				this.currentComponent=rectangle;
				
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is Rectangle){
				this.x1Value.text=(currentComponent as Rectangle).x1+"";
				this.y1Value.text=(currentComponent as Rectangle).y1+"";
				this.widthComp.text=(currentComponent as Rectangle).widthComp+"";
				this.heightComp.text=(currentComponent as Rectangle).heightComp+"";
				this.color=(currentComponent as Rectangle).color;
				this.orientation.selectedItem=(currentComponent as Rectangle).orientation;
			}
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.RECTANGLE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var rectangle:Rectangle=new Rectangle(Number(x1Value.text),Number(y1Value.text),
				Number(widthComp.text),Number(heightComp.text),orientation.selectedItem as String,color);
			rectangle.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}