package popups
{
	import component.passifs.Rectangle;
	import component.passifs.Trapezoidal;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class TrapezoidalPopup extends GenericPopup
	{
		public function TrapezoidalPopup(definedX:int=0,definedY:int=0,trapezoidal:Trapezoidal=null)
		{
			if(trapezoidal==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=trapezoidal;
				
			}
			super();
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is Trapezoidal){
				this.x1Value.text=(currentComponent as Trapezoidal).x1+"";
				this.y1Value.text=(currentComponent as Trapezoidal).y1+"";
				this.widthComp.text=(currentComponent as Trapezoidal).widthComp+"";
				this.heightComp.text=(currentComponent as Trapezoidal).heightComp+"";
				this.deviation.selectedItem=(currentComponent as Trapezoidal).orientation;
			}
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