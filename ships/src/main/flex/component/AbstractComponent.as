package component
{
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import mx.charts.chartClasses.NumericAxis;
	import mx.core.UIComponent;
	import mx.effects.Rotate;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	
	
	[Bindable]
	public class  AbstractComponent extends UIComponent
	{
		public var x1:int;
		public var y1:int;
		public var x2:int;
		public var y2:int;
		public var type:String;
		public var Code:String;
		public var libelle:String;
		public var angle:Number;
		protected var shape:Shape;
		private var rotate:Rotate=new Rotate();
		
		public function AbstractComponent(x1:int,y1:int,type:String,angle:Number){
			this.x1=x1;
			this.y1=y1;
			this.type=type;
			this.angle=angle;
		}
		public function drawComponentIn(terminal:PanZoomContent):void{
			rotateComponent(0,angle);
		}
		
		public function createPopup():GenericPopup {
			return new GenericPopup();
		}
		
		public function updateCoordinates(newX:int,newY:int):void{
			this.x1=this.x1+newX;
			this.y1=this.y1+newY;
		}
		public function clone(newX:int,newY:int):AbstractComponent{
			return new AbstractComponent(newX,newY,TypesPassifComponent.GENERIC,0);
		}
		
		public function updateAngle(newAngle:Number):void {
			rotateComponent(angle,angle+newAngle);
			this.angle=angle+newAngle;
		}
		
		public function get center():Point{
			return Point.interpolate(new Point(x1,y1),new Point(x2,y2),0.5);
		}
		
		private function rotateComponent(angleFrom:Number,angleTo:Number):void{
			rotate.target=this;
			rotate.angleFrom=angleFrom;
			rotate.angleTo=angleTo;
			rotate.originX=center.x;
			rotate.originY=center.y;
			rotate.play();
		}
	}
}