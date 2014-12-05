package component.passifs
{
	import component.AbstractComponent;
	import component.passifs.dto.RailCoordinatesDto;
	import component.passifs.dto.TypesPassifComponent;
	import component.passifs.utils.GeomUtil;
	
	import flash.display.GraphicsPathCommand;
	import flash.display.Shape;
	import flash.geom.Point;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	import popups.RoutePopup;

	[Bindable]
	public class Route extends AbstractComponent  
	{
		public var x2:int;
		public var y2:int;
		protected var effectiveGap:Number;
		protected var separateGap:Number;
		
		public function Route(x1:int,y1:int,x2:int,y2:int)
		{
			super(x1,y1,TypesPassifComponent.ROUTE);
			this.x2=x2;
			this.y2=y2;
			this.effectiveGap=1.5;
			this.separateGap=1.5;
		}
		
		override public function createPopup():GenericPopup{
			return new RoutePopup(0,0,this);
		}
		
		override public function clone(newX1:int,newY1:int):AbstractComponent{
			var secondPoint:Point=calculateTheSecondPoint(newX1,newY1);
			return new Route(newX1,newY1,secondPoint.x,secondPoint.y);
		}
		
		override public function drawComponentIn(terminal:PanZoomContent):void{
			var initStart:Point = new Point(x1, y1);
			var initEnd:Point = new Point(x2, y2);
			var shape:Shape = new Shape();
			shape.graphics.lineStyle(1.5, 0);
			drawTwoParallelLines(shape,initStart,initEnd);
			drawSeparateLines(shape,initStart,initEnd);
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		
		
		override public function updateCoordinates(newX:int,newY:int):void{
			super.updateCoordinates(newX,newY);
			this.x2=this.x2+newX;
			this.y2=this.y2+newX;
		}
		
		private function calculateTheSecondPoint(newX1:int,newY1:int):Point{
			var newX2:int=x2-x1+newX1;
			var newY2:int=y2-y1+newY1;
			return new Point(newX2,newY2);
		}
		
		private function drawTwoParallelLines(shape:Shape,initStart:Point,initEnd:Point):void{
			var railCoordinates:RailCoordinatesDto=GeomUtil.retrieveTopAndBottomPoints(initStart,initEnd,effectiveGap);
			shape.graphics.moveTo(railCoordinates.topStart.x,railCoordinates.topStart.y);
			shape.graphics.lineTo(railCoordinates.topEnd.x,railCoordinates.topEnd.y);
			shape.graphics.moveTo(railCoordinates.bottomStart.x,railCoordinates.bottomStart.y);
			shape.graphics.lineTo(railCoordinates.bottomEnd.x,railCoordinates.bottomEnd.y);
		}
		
		private function drawSeparateLines(shape:Shape,initStart:Point,initEnd:Point):void{
			var railCoordinates:RailCoordinatesDto=GeomUtil.retrieveTopAndBottomPoints(initStart,initEnd,separateGap);
			var distance:Number=Point.distance(initStart,initEnd);
			var maxInterpolation:int=distance / 10;
			var commands:Vector.<int> = new Vector.<int>();
			// retrive the list of points
			var data:Vector.<Number> = new Vector.<Number>();
			var indexOfCommands:int=0;
			var indexOfData:int=0;
			for (var index:int = 0; index <= maxInterpolation; index++) 
			{ 
				var niveauInterpolation:Number=niveauInterpolation(index,maxInterpolation);
				commands[indexOfCommands++] = GraphicsPathCommand.MOVE_TO;
				commands[indexOfCommands++] = GraphicsPathCommand.LINE_TO;
				var point1:Point=Point.interpolate(railCoordinates.topStart,railCoordinates.topEnd,niveauInterpolation);
				var point2:Point=Point.interpolate(railCoordinates.bottomStart,railCoordinates.bottomEnd,niveauInterpolation);
				data[indexOfData++] = point1.x;
				data[indexOfData++] = point1.y;
				data[indexOfData++] = point2.x;
				data[indexOfData++] = point2.y;
			}
			
			shape.graphics.drawPath(commands, data);
		}
		private function niveauInterpolation(currentIndex:int,maxInterpolation:int):Number{
			if(currentIndex==0){
				return 0;
			}
			return currentIndex/maxInterpolation;
		}
	}
}