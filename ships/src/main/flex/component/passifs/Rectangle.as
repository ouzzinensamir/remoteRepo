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
	public class Rectangle extends AbstractComponent
	{
		protected var widthComp:int;
		protected var heightComp:int;
		protected var type:String;
		private var color:uint;
		private var shape:Shape = new Shape();
		public function Rectangle(x1:int,y1:int,widthComp:int,heightComp:int,orientation:String,color:uint){
			this.x1=x1;
			this.y1=y1;
			this.widthComp=orientation =="Gauche"? -widthComp : widthComp;
			this.heightComp=orientation == "Gauche"? -heightComp : heightComp;
			this.color=color;
			this.type=TypesPassifComponent.RECTANGLE;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			shape.graphics.clear();
			shape.graphics.beginFill(color,1.0);
			shape.graphics.drawRect(x1, y1,widthComp,heightComp);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
	}
}