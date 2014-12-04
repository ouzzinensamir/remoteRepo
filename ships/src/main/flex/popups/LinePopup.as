package popups
{
	import component.passifs.DegradedLine;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class LinePopup extends GenericPopup
	{
		public function LinePopup(definedX:int=0,definedY:int=0,line:DegradedLine=null)
		{
			super();
			if(line==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=line;
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is DegradedLine){
				this.x1Value.text=(currentComponent as DegradedLine).x1+"";
				this.y1Value.text=(currentComponent as DegradedLine).y1+"";
				this.x2Value.text=(currentComponent as DegradedLine).x2+"";
				this.y2Value.text=(currentComponent as DegradedLine).y2+"";
			}
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