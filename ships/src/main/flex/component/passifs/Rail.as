package component.passifs
{
	
	import component.AbstractComponent;
	import component.Terminal;
	
	import flash.display.GraphicsPathCommand;
	import flash.display.Shape;
	import flash.geom.Point;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import component.passifs.dto.RailCoordinates;
	import component.passifs.dto.TypesPassifComponent;
	

	[Bindable]
	public class Rail extends  AbstractComponent
	{
		protected var x2:int;
		protected var y2:int;
		protected var type:String;
		private var shape:Shape = new Shape();

		protected var effectiveGap:Number;
		protected var separateGap:Number;
		
		
		public function Rail(x1:int,y1:int,x2:int,y2:int)
		{
			this.x1=x1;
			this.y1=y1;
			this.x2=x2;
			this.y2=y2;
			this.type=TypesPassifComponent.RAIL;
			this.effectiveGap=2;
			this.separateGap=4;
		}
		
		override public function drawComponentIn(terminal:Terminal):void{
			var initStart:Point = new Point(x1, y1);
			var initEnd:Point = new Point(x2, y2);
			shape.graphics.clear();
			shape.graphics.lineStyle(1.5, 0);
			drawTwoParallelLines(shape,initStart,initEnd);
			drawSeparateLines(shape,initStart,initEnd);
			this.addChild(shape);
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		
		private function drawTwoParallelLines(shape:Shape,initStart:Point,initEnd:Point):void{
			var railCoordinates:RailCoordinates=retrieveTopAndBottomPoints(initStart,initEnd,effectiveGap);
			shape.graphics.moveTo(railCoordinates.topStart.x,railCoordinates.topStart.y);
			shape.graphics.lineTo(railCoordinates.topEnd.x,railCoordinates.topEnd.y);
			shape.graphics.moveTo(railCoordinates.bottomStart.x,railCoordinates.bottomStart.y);
			shape.graphics.lineTo(railCoordinates.bottomEnd.x,railCoordinates.bottomEnd.y);
		}
		
		private function drawSeparateLines(shape:Shape,initStart:Point,initEnd:Point):void{
			var railCoordinates:RailCoordinates=retrieveTopAndBottomPoints(initStart,initEnd,separateGap);
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
		protected function niveauInterpolation(currentIndex:int,maxInterpolation:int):Number{
			if(currentIndex==0){
				return 0;
			}if(currentIndex==maxInterpolation){
				return 0.99;
			}
			return currentIndex/maxInterpolation;
		}
		
		private function retrieveTopAndBottomPoints(initStart:Point,initEnd:Point,gap:Number):RailCoordinates{
			var mouseAngle:Number = Math.atan2( initEnd.y - initStart.y, initEnd.x - initStart.x );
			var angle:Number;
			var radians:Number = 180 / Math.PI;
			//Define the top  point
			angle = 90 / radians + mouseAngle;
			var topOffsetX:Number = Math.cos( angle ) * gap;
			var topOffsetY:Number = Math.sin( angle ) * gap;
			var topStart:Point = new Point(initStart.x + topOffsetX, initStart.y + topOffsetY);
			var topEnd:Point = new Point(initEnd.x + topOffsetX, initEnd.y + topOffsetY);
			//Define the bottom  point
			angle = -90 / radians + mouseAngle;
			var bottomOffsetX:Number = Math.cos( angle ) * gap;
			var bottomOffsetY:Number = Math.sin( angle ) * gap;
			var bottomStart:Point = new Point(initStart.x + bottomOffsetX, initStart.y + bottomOffsetY);
			var bottomEnd:Point = new Point(initEnd.x + bottomOffsetX, initEnd.y + bottomOffsetY);
			return new RailCoordinates(topStart,topEnd,bottomStart,bottomEnd);
		}
	}
}