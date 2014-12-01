package component.passifs
{
	import component.AbstractComponent;
	import component.Terminal;
	
	import flash.display.Shape;
	
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	import component.passifs.dto.TypesPassifComponent;

	[Bindable]
	public class Rectangle extends AbstractComponent
	{
		protected var widthComp:int;
		protected var heightComp:int;
		protected var type:String;
		private var shape:Shape = new Shape();
		public function Rectangle(x1:int,y1:int,widthComp:int,heightComp:int,orientation:String){
			this.x1=x1;
			this.y1=y1;
			if(orientation=="Gauche"){
				this.widthComp=-widthComp;
				this.heightComp=-heightComp;
			}else{
				this.widthComp=widthComp;
				this.heightComp=heightComp;
			}
			
			this.type=TypesPassifComponent.RECTANGLE;
		}
		override public function drawComponentIn(terminal:Terminal):void{
			shape.graphics.clear();
			shape.graphics.beginFill(0x3366FF, 1.0);
			shape.graphics.drawRect(x1, y1,widthComp,heightComp);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
	}
}