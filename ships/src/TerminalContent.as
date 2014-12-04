package
{
	import component.AbstractComponent;
	
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.operations.CopyOperation;
	
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	import org.rockholla.controls.panzoom.PanZoomContent;
	
	import popups.GenericPopup;
	
	public class TerminalContent extends PanZoomContent
	{
		[Bindable]
		public var coordonneX:String;
		[Bindable]
		public var coordonneY:String;
		
		private var componentGrid:UIComponent;
		
		public function TerminalContent()
		{
			super();
			this.width = 3000;
			this.height = 5000;
			this.backgroundColor = 0xF2EFDC;
			this.backgroundAlpha = 1;
			this.borderColor = 0x000000;
			this.borderThickness = 10;
			this.borderAlpha = 0.4;
		}
		
		override protected function _onCreationComplete(event:FlexEvent):void
		{
			super._onCreationComplete(event);
			this.addEventListener(MouseEvent.MOUSE_DOWN, this._onMouseDown); 
			this.addEventListener(MouseEvent.MOUSE_UP, this._onMouseUp); 
			this.addEventListener(MouseEvent.MOUSE_MOVE, this._onMouseMove); 
			this.addEventListener(MouseEvent.MOUSE_OUT, this._onMouseOut); 
			this.doubleClickEnabled=true;
			this.addEventListener(MouseEvent.DOUBLE_CLICK, this._doubleClick); 
		}
		
		override protected function _drawContent(isRedraw:Boolean = true):void
		{
			super._drawContent(isRedraw);
		}
		
		private function _onMouseDown(event:MouseEvent):void
		{
			var dragInitiator:AbstractComponent;				
			if(event.target as AbstractComponent!=null){
				dragInitiator=event.target as AbstractComponent;
				dragInitiator.startDrag(false);
			}
			
		}
		
		private function _onMouseUp(event:MouseEvent):void
		{
			var dragInitiator:AbstractComponent;
			if(event.target as AbstractComponent!=null){
				dragInitiator=event.target as AbstractComponent;
				var newX:int=dragInitiator.x;
				var newY:int=dragInitiator.y;
				dragInitiator.updateCoordinates(newX,newY);
				dragInitiator.stopDrag();
			}
		}
		
		private function _onMouseMove(event:MouseEvent):void
		{
			coordonneX=contentMouseX.toString();
			coordonneY=contentMouseY.toString();				
		}
		
		private function _onMouseOut(event:MouseEvent):void
		{
			coordonneX="--";
			coordonneY="--";
		}
		private function _doubleClick(event:MouseEvent):void
		{
			if( event.target !=null && (event.target is AbstractComponent)){
				var clickedComponent:AbstractComponent=event.target as AbstractComponent;
				var coordinates:GenericPopup=clickedComponent.createPopup();
				coordinates.terminal=this;
				PopUpManager.addPopUp(coordinates,this,true);
				PopUpManager.centerPopUp(coordinates);
			}				
			
		}
		
		public function drawPanZoomContentGrid():void 
		{
			var xAt:int = 0;
			var yAt:int = 0;
			var shapeGrid:Shape=new Shape();
			shapeGrid.graphics.clear();
			shapeGrid.graphics.lineStyle(0.5, 0x000000, 0.2);
			// draw the vertical lines
			while (xAt <= this.widthAsSet) 
			{
				shapeGrid.graphics.moveTo(xAt, 0);
				shapeGrid.graphics.lineTo(xAt, this.heightAsSet);
				xAt = xAt + 20;
			}
			// draw the horizontal lines
			while (yAt <= this.heightAsSet) 
			{
				shapeGrid.graphics.moveTo(0, yAt);
				shapeGrid.graphics.lineTo(this.widthAsSet, yAt);
				yAt = yAt + 20;
			}
			componentGrid=new UIComponent();
			componentGrid.addChild(shapeGrid);
			this.addChild(componentGrid);
		}
		public function handelGrid():void{
			if(componentGrid !=null){
				this.removeChild(componentGrid);
				componentGrid=null;
				return;
			}
			drawPanZoomContentGrid();
		}
		
	}
}