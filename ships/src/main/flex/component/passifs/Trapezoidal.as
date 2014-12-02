package component.passifs
{
	import component.AbstractComponent;
	import component.Terminal;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	
	import org.rockholla.controls.panzoom.PanZoomContent;

	[Bindable]
	public class Trapezoidal extends AbstractComponent
	{
		protected var widthComp:int;
		protected var heightComp:int;
		protected var type:String;
		private var shape:Shape = new Shape();
		private var deviation:Number;
		private var orientation:String;
		public function Trapezoidal(x1:int,y1:int,widthComp:int,heightComp:int,orientation:String){
			this.x1=x1;
			this.y1=y1;
			this.widthComp= widthComp;
			this.heightComp= heightComp;
			this.orientation=orientation;
			this.deviation= 4;
			this.type=TypesPassifComponent.TRAPEZOIDAL;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			shape.graphics.clear();
			shape.graphics.beginFill(0x612BA8, 1.0);
			orientation=="Haut" ? createTrapezoidalWithOrientationHaut() : createTrapezoidalWithOrientationBas();
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		private function createTrapezoidalWithOrientationHaut():void{
			shape.graphics.moveTo(x1,y1);
			shape.graphics.lineTo(x1+widthComp,y1);
			shape.graphics.lineTo((x1+widthComp)-deviation,y1+heightComp);
			shape.graphics.lineTo(x1+deviation,y1+heightComp);
			shape.graphics.lineTo(x1,y1);
		}
		private function createTrapezoidalWithOrientationBas():void{
			shape.graphics.moveTo(x1+deviation,y1);
			shape.graphics.lineTo((x1+widthComp)-deviation,y1);
			shape.graphics.lineTo(x1+widthComp,y1+heightComp);
			shape.graphics.lineTo(x1,y1+heightComp);
			shape.graphics.lineTo(x1+deviation,y1);
		}
	}
}