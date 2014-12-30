package popups
{
	import component.passifs.Space;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class SpacePopup extends GenericPopup
	{
		private var color:uint;
		public function SpacePopup(definedX:int=0,definedY:int=0,color:uint=0,space:Space=null)
		{
			super();
			if(space==null){
				this.definedX=definedX;
				this.definedY=definedY;
				this.color=color;
			}else{
				this.currentComponent=space;
				
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is Space){
				this.x1Value.text=(currentComponent as Space).x1+"";
				this.y1Value.text=(currentComponent as Space).y1+"";
				this.widthComp.text=(currentComponent as Space).widthComp+"";
				this.heightComp.text=(currentComponent as Space).heightComp+"";
				this.color=(currentComponent as Space).color;
				this.orientation.selectedItem=(currentComponent as Space).orientation;
				this.componentLabel.text=(currentComponent as Space).componentLabel;
			}
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.SPACE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var rectangle:Space=new Space(Number(x1Value.text),Number(y1Value.text),
				Number(widthComp.text),Number(heightComp.text),orientation.selectedItem as String,color,componentLabel.text);
			rectangle.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}