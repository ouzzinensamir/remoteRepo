package component.passifs.dto
{
	import flash.geom.Point;

	public class RailCoordinates
	{
		private var _topStart:Point;
		private var _topEnd:Point;
		private var _bottomStart:Point;
		private var _bottomEnd:Point;
		
		public function RailCoordinates(topStart:Point,topEnd:Point,bottomStart:Point,bottomEnd:Point)
		{
			this._topStart=topStart;
			this._topEnd=topEnd;
			this._bottomStart=bottomStart;
			this._bottomEnd=bottomEnd;
		}
		
		public function get topStart():Point
		{
			return this._topStart;
		}
		
		public function get topEnd():Point{
			return this._topEnd;
		}
		
		public function get bottomStart():Point{
			return this._bottomStart;
		}
		
		public function get bottomEnd():Point{
			return this._bottomEnd;
		}
		
	}
}