package component.passifs
{
	import component.AbstractComponent;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	import popups.SpacePopup;

	[Bindable]
	public class Space extends AbstractComponent
	{
		public var widthComp:int;
		public var heightComp:int;
		public var color:uint;
		public var orientation:String;
		
		public function Space(x1:int,y1:int,widthComp:int,heightComp:int,orientation:String,color:uint){
			super(x1,y1,TypesPassifComponent.SPACE);
			this.widthComp= widthComp;
			this.heightComp= heightComp;
			this.orientation=orientation;
			this.color=color;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			var shape:Shape = new Shape();
			var signe:Number=orientation =="Gauche"? -1 :1;
			shape.graphics.beginFill(color,1.0);
			shape.graphics.drawRect(x1, y1,signe*widthComp,signe*heightComp);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		override public function createPopup():GenericPopup{
			return new SpacePopup(0,0,0,this);
		}
		override public function clone(newX:int,newY:int):AbstractComponent{
			return new Space(newX,newY,widthComp,heightComp,orientation,color);
		}
	}
}