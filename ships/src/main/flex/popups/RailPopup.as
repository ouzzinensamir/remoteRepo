package popups
{
	import component.passifs.Rail;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class RailPopup extends GenericPopup
	{
		public function RailPopup(definedX:int=0,definedY:int=0,rail:Rail=null)
		{
			super();
			if(rail==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=rail;
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is Rail){
				this.x1Value.text=(currentComponent as Rail).x1+"";
				this.y1Value.text=(currentComponent as Rail).y1+"";
				this.x2Value.text=(currentComponent as Rail).x2+"";
				this.y2Value.text=(currentComponent as Rail).y2+"";
			}
		}
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.RAIL;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var x1:int=Number(x1Value.text);
			var y1:int=Number(y1Value.text);
			var x2:int=Number(x2Value.text);
			var y2:int=Number(y2Value.text);
			var angle:Number=angleValue.text!=null ? Number(angleValue.text) : 0;
			var rail:Rail=new Rail(x1,y1,x2,y2,angle);
			rail.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}