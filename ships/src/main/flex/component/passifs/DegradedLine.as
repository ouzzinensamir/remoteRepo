package component.passifs
{
	import component.AbstractComponent;
	import component.Terminal;
	
	import flash.display.Shape;
	
	import mx.core.UIComponent;
	import component.passifs.dto.TypesPassifComponent;

	[Bindable]
	public class DegradedLine extends Rail  
	{
		
		public function DegradedLine(x1:int,y1:int,x2:int,y2:int)
		{
			super(x1,y1,x2,y2);
			this.type=TypesPassifComponent.LINE;
			this.effectiveGap=1.5;
			this.separateGap=1.5;
		}
		
		override protected function niveauInterpolation(currentIndex:int,maxInterpolation:int):Number{
			if(currentIndex==0){
				return 0;
			}
			return currentIndex/maxInterpolation;
		}
		
		
	}
}