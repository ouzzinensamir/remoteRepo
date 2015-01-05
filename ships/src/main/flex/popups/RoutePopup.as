package popups
{
	import component.passifs.Route;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class RoutePopup extends GenericPopup
	{
		public function RoutePopup(definedX:int=0,definedY:int=0,route:Route=null)
		{
			super();
			if(route==null){
				this.definedX=definedX;
				this.definedY=definedY;
			}else{
				this.currentComponent=route;
			}
			this.addEventListener(FlexEvent.CREATION_COMPLETE, _onCreationComplete);
		}
		protected function _onCreationComplete(event:FlexEvent):void
		{
			if(this.currentComponent != null && currentComponent is Route){
				this.x1Text.text=(currentComponent as Route).x1+"";
				this.y1Text.text=(currentComponent as Route).y1+"";
				this.x2Text.text=(currentComponent as Route).x2+"";
				this.y2Text.text=(currentComponent as Route).y2+"";
			}
		}
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.ROUTE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var route:Route=new Route(x1Value,y1Value,x2Value,y2Value,angle);
			route.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}