package popups
{
	import component.passifs.NicheReefer;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class NicheReeferPopup extends GenericPopup
	{
		public function NicheReeferPopup(definedX:int=0,definedY:int=0,nicheReefer:NicheReefer=null)
		{
			if(nicheReefer==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=nicheReefer;
			}
			super();
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is NicheReefer){
				initializeValues();
				this.heightComp.text=(currentComponent as NicheReefer).heightComp+"";
				this.deviation.selectedItem=(currentComponent as NicheReefer).orientation;
			}
		}
		
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.NICHE_REEFER;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var widthComp:int= calcultateComponentWith();
			var nicheReefer:NicheReefer=new NicheReefer(x1Value,y1Value,x2Value,y2Value,
				widthComp,Number(heightComp.text),deviation.selectedItem as String,angle);
			nicheReefer.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}