package component.passifs
{
	import component.AbstractComponent;
	import component.Terminal;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	import popups.RectPopup;

	[Bindable]
	public class Rectangle extends AbstractComponent
	{
		public var widthComp:int;
		public var heightComp:int;
		public var color:uint;
		public var orientation:String;
		protected var type:String;
		private var shape:Shape = new Shape();
		public function Rectangle(x1:int,y1:int,widthComp:int,heightComp:int,orientation:String,color:uint){
			this.x1=x1;
			this.y1=y1;
			this.widthComp= widthComp;
			this.heightComp= heightComp;
			this.orientation=orientation;
			this.color=color;
			this.type=TypesPassifComponent.RECTANGLE;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			var signe:Number=orientation =="Gauche"? -1 :1;
			shape.graphics.clear();
			shape.graphics.beginFill(color,1.0);
			shape.graphics.drawRect(x1, y1,signe*widthComp,signe*heightComp);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		override public function createPopup():GenericPopup{
			return new RectPopup(0,0,0,this);
		}
	}
}