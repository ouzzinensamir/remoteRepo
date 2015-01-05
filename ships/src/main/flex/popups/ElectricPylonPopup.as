package popups
{
	import component.passifs.Route;
	import component.passifs.ElectricPylon;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class ElectricPylonPopup extends GenericPopup
	{
		
		public function ElectricPylonPopup(definedX:int=0,definedY:int=0,electricPylon:ElectricPylon=null)
		{
			super();
			if(electricPylon==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=electricPylon;
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is ElectricPylon){
				this.x1Value.text=(currentComponent as ElectricPylon).x1+"";
				this.y1Value.text=(currentComponent as ElectricPylon).y1+"";
				this.raduisValue.text=(currentComponent as ElectricPylon).raduisValue+"";
			}
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.ELECTRIC_PYLON;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var x1:int=Number(x1Value.text);
			var y1:int=Number(y1Value.text);
			var angle:Number=angleValue.text!=null ? Number(angleValue.text) : 0;
			var electricPylon:ElectricPylon=new ElectricPylon(x1,y1,Number(raduisValue.text),angle);
			electricPylon.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}