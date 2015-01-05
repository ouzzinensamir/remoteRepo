package component.passifs
{
	import component.AbstractComponent;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.ElectricPylonPopup;
	import popups.GenericPopup;

	[Bindable]
	public class ElectricPylon extends AbstractComponent
	{
		public var raduisValue:Number;
		public function ElectricPylon(x1:int,y1:int,raduisValue:Number,angle:Number){
			super(x1,y1,TypesPassifComponent.ELECTRIC_PYLON,angle);
			this.raduisValue=raduisValue;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			shape= new Shape();
			shape.graphics.clear();
			shape.graphics.beginFill(0, 1.0);
			shape.graphics.drawCircle(x1, y1,raduisValue);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		override public function createPopup():GenericPopup{
			return new ElectricPylonPopup(0,0,this);
		}
		
		override public function clone(newX:int,newY:int):AbstractComponent{
			return new ElectricPylon(newX,newY,raduisValue,angle);
		}
		override public function get center():Point{
			return new Point(x1+shape.width/2,y1+shape.height/2);
		}
		
	}
}