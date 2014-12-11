package
{
	import component.AbstractComponent;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
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
		
		[Bindable]
		public var selectedComponent:AbstractComponent;
		
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
		
		public function clean():void{
			var children:Array=this.getChildren();
			if(children == null){
				return ;
			}
			for (var index:int = 0; index < children.length; index++) {
				var child:DisplayObject=children[index];
				if(child is AbstractComponent){
					this.removeChild(child);
				}
			}
		}
		
		
		private function _onMouseDown(event:MouseEvent):void
		{
			if(event.target!=null && event.target is AbstractComponent){
				selectedComponent=event.target as AbstractComponent;
				selectedComponent.setFocus();
				selectedComponent.focusRect=true;
				selectedComponent.startDrag(false);
			}else{
			 selectedComponent=null
			}
		}
		
		private function _onMouseUp(event:MouseEvent):void
		{
			
			if(event.target!=null && event.target is AbstractComponent){
				selectedComponent=event.target as AbstractComponent;
				var newX:int=selectedComponent.x;
				var newY:int=selectedComponent.y;
				//selectedComponent.updateCoordinates(newX,newY);
				selectedComponent.setFocus();
				selectedComponent.focusRect=true;
				selectedComponent.stopDrag();
			}else{
				selectedComponent=null
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
				clickedComponent.setFocus();
				clickedComponent.focusRect=true;
				var coordinates:GenericPopup=clickedComponent.createPopup();
				coordinates.terminal=this;
				PopUpManager.addPopUp(coordinates,this,true);
				PopUpManager.centerPopUp(coordinates);
			}				
			
		}
		
		
		public function handelGrid():void{
			if(componentGrid !=null){
				this.removeChild(componentGrid);
				componentGrid=null;
				return;
			}
			drawPanZoomContentGrid();
		}
		
		public function removeSelectedComponent():void{
			if(selectedComponent != null){
				this.removeChild(selectedComponent);
				selectedComponent =null;
			}
		}
		
		public function rotate():void{
			if(selectedComponent != null){
				selectedComponent.rotation=30;
			}
		}
		
		public function pasteSelectedComponent(definedX:int,definedY:int):void{
			if(selectedComponent != null){
				var newComponent:AbstractComponent=selectedComponent.clone(definedX,definedY);
				newComponent.drawComponentIn(this);
			}else{
				Alert.show("Aucune composant n'est selectionné");
			}
		}
		
		private function drawPanZoomContentGrid():void 
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
		
	}
}