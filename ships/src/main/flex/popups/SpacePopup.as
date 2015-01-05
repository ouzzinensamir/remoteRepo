package popups
{
	import component.passifs.Space;
	import component.passifs.dto.TypesPassifComponent;
	import component.passifs.utils.Orientation;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
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
				this.x1Text.text=(currentComponent as Space).x1+"";
				this.y1Text.text=(currentComponent as Space).y1+"";
				this.x2Text.text=(currentComponent as Space).x2+"";
				this.y2Text.text=(currentComponent as Space).y2+"";
				this.heightComp.text=(currentComponent as Space).heightComp+"";
				this.color=(currentComponent as Space).color;
				this.componentLabel.text=(currentComponent as Space).componentLabel;
			}
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.SPACE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var widthComp:int= calcultateComponentWith();
			var orientation:String = x2Value < x1Value ? Orientation.L : Orientation.R;
			var rectangle:Space=new Space(x1Value,y1Value,x2Value,y2Value,
				widthComp,Number(heightComp.text),orientation,color,componentLabel.text,angle);
			rectangle.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
		
	}
}