package component.passifs.utils
{
	import component.passifs.dto.RailCoordinatesDto;
	
	import flash.geom.Point;

	public final class GeomUtil
	{
		public function GeomUtil()
		{
		}
		public static function retrieveTopAndBottomPoints(initStart:Point,initEnd:Point,gap:Number):RailCoordinatesDto{
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
			return new RailCoordinatesDto(topStart,topEnd,bottomStart,bottomEnd);
		}
		
	}
}