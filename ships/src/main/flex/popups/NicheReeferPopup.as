package popups
{
	import component.passifs.Space;
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
				this.x1Value.text=(currentComponent as NicheReefer).x1+"";
				this.y1Value.text=(currentComponent as NicheReefer).y1+"";
				this.widthComp.text=(currentComponent as NicheReefer).widthComp+"";
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
			var nicheReefer:NicheReefer=new NicheReefer(Number(x1Value.text),Number(y1Value.text),
				Number(widthComp.text),Number(heightComp.text),deviation.selectedItem as String);
			nicheReefer.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}