package component.passifs
{
	import component.AbstractComponent;
	import component.passifs.dto.TypesPassifComponent;
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	import popups.NicheReeferPopup;

	[Bindable]
	public class NicheReefer extends AbstractComponent
	{
		public var widthComp:int;
		public var heightComp:int;
		public var orientation:String;
		private var deviation:Number;
		
		public function NicheReefer(x1:int,y1:int,x2:int,y2:int,widthComp:int,heightComp:int,orientation:String,angle:Number){
			super(x1,y1,TypesPassifComponent.NICHE_REEFER,angle);
			this.x2=x2;
			this.y2=y2;
			this.widthComp= widthComp;
			this.heightComp= heightComp;
			this.orientation=orientation;
			this.deviation= 4;
		}
		override public function drawComponentIn(terminal:PanZoomContent):void{
			shape= new Shape();
			shape.graphics.beginFill(0x612BA8, 1.0);
			orientation=="Haut" ? createTrapezoidalWithOrientationHaut(shape) : createTrapezoidalWithOrientationBas(shape);
			shape.graphics.endFill();
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		override public function createPopup():GenericPopup{
			return new NicheReeferPopup(0,0,this);
		}
		
		override public function clone(newX:int,newY:int):AbstractComponent{
			return new NicheReefer(newX,newY,x2,y2,widthComp,heightComp,orientation,angle);
		}
		
		override public function get center():Point{
			return new Point(x1+shape.width/2,y1+shape.height/2);
		}
		
		private function createTrapezoidalWithOrientationHaut(shape:Shape):void{
			shape.graphics.moveTo(x1,y1);
			shape.graphics.lineTo(x1+widthComp,y1);
			shape.graphics.lineTo((x1+widthComp)-deviation,y1+heightComp);
			shape.graphics.lineTo(x1+deviation,y1+heightComp);
			shape.graphics.lineTo(x1,y1);
		}
		private function createTrapezoidalWithOrientationBas(shape:Shape):void{
			shape.graphics.moveTo(x1+deviation,y1);
			shape.graphics.lineTo((x1+widthComp)-deviation,y1);
			shape.graphics.lineTo(x1+widthComp,y1+heightComp);
			shape.graphics.lineTo(x1,y1+heightComp);
			shape.graphics.lineTo(x1+deviation,y1);
		}
	}
}