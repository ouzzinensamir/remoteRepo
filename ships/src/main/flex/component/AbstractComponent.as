package component
{
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	
	
	[Bindable]
	public class  AbstractComponent extends UIComponent
	{
		public var x1:int;
		public var y1:int;
		public var type:String;
		protected var shape:Shape;
		
		public function AbstractComponent(x1:int,y1:int,type:String){
			this.x1=x1;
			this.y1=y1;
			this.type=type;
		}
		public function drawComponentIn(terminal:PanZoomContent):void{
			
		}
		
		public function createPopup():GenericPopup {
			return new GenericPopup();
		}
		
		public function updateCoordinates(newX:int,newY:int):void{
			this.x1=this.x1+newX;
			this.y1=this.y1+newY;
		}
		public function clone(newX:int,newY:int):AbstractComponent{
			return new AbstractComponent(newX,newY,TypesPassifComponent.GENERIC);
		}
		public function rotate():void{
			if(shape != null){
			 shape.rotation=30;
			}
		}
		
		public function get centerX():int{
			return x1+shape.width/2;
		}
		
		 public function get centerY():int{
			return y1+shape.height/2;
		}
	}
}