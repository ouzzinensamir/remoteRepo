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
	public class PointComp extends AbstractComponent
	{
		private var raduisValue:Number;
		protected var type:String;
		private var shape:Shape = new Shape();
		public function PointComp(x1:int,y1:int,raduisValue:Number){
			this.x1=x1;
			this.y1=y1;
			this.raduisValue=raduisValue;
			this.type=TypesPassifComponent.POINT;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			shape.graphics.clear();
			shape.graphics.beginFill(0, 1.0);
			shape.graphics.drawCircle(x1, y1,raduisValue);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
	}
}