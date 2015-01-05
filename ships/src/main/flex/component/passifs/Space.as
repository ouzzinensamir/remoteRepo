package component.passifs
{
	import component.AbstractComponent;
	import component.passifs.dto.TypesPassifComponent;
	import component.passifs.utils.Orientation;
	
	import flash.display.Shape;
	import flash.geom.Point;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	import popups.SpacePopup;
	
	import spark.components.Label;

	[Bindable]
	public class Space extends AbstractComponent
	{
		public var widthComp:int;
		public var heightComp:int;
		public var color:uint;
		public var orientation:String;
		public var componentLabel:String;
		
		public function Space(x1:int,y1:int,x2:int,y2:int,widthComp:int,heightComp:int,orientation:String,color:uint,componentLabel:String,angle:Number){
			super(x1,y1,TypesPassifComponent.SPACE,angle);
			this.x2=x2;
			this.y2=y2;
			this.widthComp= widthComp;
			this.heightComp= heightComp;
			this.orientation=orientation;
			this.color=color;
			this.componentLabel=componentLabel;
		}
		
		override public function drawComponentIn(terminal:PanZoomContent):void{
			shape= new Shape();
			var sign:Number=orientation == Orientation.L ? -1 :1;
			shape.graphics.beginFill(color,1.0);
			shape.graphics.drawRect(x1, y1,sign*widthComp,sign*heightComp);
			shape.graphics.endFill();
			this.addChild(shape);
			addLabel();
			terminal.addChild(this);
			super.drawComponentIn(terminal);
		}
		override public function createPopup():GenericPopup{
			return new SpacePopup(0,0,0,this);
		}
		override public function clone(newX:int,newY:int):AbstractComponent{
			return new Space(newX,newY,x2,y2,widthComp,heightComp,orientation,color,componentLabel,angle);
		}
		override public function get center():Point{
			return new Point(x1+shape.width/2,y1+shape.height/2);
		}

		private function addLabel():void{
			if(componentLabel != null && componentLabel.length>0){
				var label:Label = new Label();
				label.text=componentLabel;
				label.x=center.x;
				label.y=center.y;
				label.width=widthComp/2;
				label.height=heightComp/2;
				this.addChild(label);
			}
		}
	}
}