package popups
{
	import component.passifs.DegradedLine;
	import component.passifs.PointComp;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class PointPopup extends GenericPopup
	{
		
		public function PointPopup(definedX:int=0,definedY:int=0,pointComp:PointComp=null)
		{
			super();
			if(pointComp==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=pointComp;
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is PointComp){
				this.x1Value.text=(currentComponent as PointComp).x1+"";
				this.y1Value.text=(currentComponent as PointComp).y1+"";
				this.raduisValue.text=(currentComponent as PointComp).raduisValue+"";
			}
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