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
				this.x1Value.text=(currentComponent as Route).x1+"";
				this.y1Value.text=(currentComponent as Route).y1+"";
				this.x2Value.text=(currentComponent as Route).x2+"";
				this.y2Value.text=(currentComponent as Route).y2+"";
			}
		}
		override protected function updateDisplayList(
			unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			super.currentState=TypesPassifComponent.ROUTE;
		}
		
		override protected function addNewComponent(event:MouseEvent):void{
			var x1:int=Number(x1Value.text);
			var y1:int=Number(y1Value.text);
			var x2:int=Number(x2Value.text);
			var y2:int=Number(y2Value.text);
			var angle:Number=angleValue.text!=null ? Number(angleValue.text) : 0;
			var route:Route=new Route(x1,y1,x2,y2,angle);
			route.drawComponentIn(terminal);
			super.addNewComponent(event);
		}
	}
}