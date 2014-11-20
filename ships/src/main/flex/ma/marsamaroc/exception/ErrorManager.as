package ma.marsamaroc.exception
{
	import component.dialogBox.MsgBox;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import ma.marsamaroc.exception.asynchrone.server.ServerCallException;
	import ma.marsamaroc.exception.synchrone.LocalException;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.FlexGlobals;

	public class ErrorManager
	{
		
		
		// Generic exception handler
		public static function onHandelException(obj:Object):void
		{
			// Error handled by code
			if (obj is LocalException || obj is Error)
			{
				var msg:String;
				var type:String;
				var stack:String;
				if (obj is LocalException)
				{
					msg=CodeConverter.getMessage(obj.code);
					type=obj.type;
					stack=obj.stack;
				}
				else
				{
					msg=obj.message;
					stack=obj.getStackTrace();
					type=TypeException.ERROR;
				}

				if (type == TypeException.INFO)
				{
					MsgBox.showInfo(Sprite(FlexGlobals.topLevelApplication), "Information", msg);
				}
				else if (type == TypeException.ERROR)
				{
					MsgBox.showError(Sprite(FlexGlobals.topLevelApplication), "Erreur", msg, stack);
				}
			}

			// Error handled by the server
			else if (obj is ServerCallException)
			{
				var errorServer:ServerCallException=obj as ServerCallException;
				if (errorServer.type == TypeException.INFO)
				{
					var tmp:String =  CodeConverter.getMessage(errorServer.code,errorServer.params);
					MsgBox.showInfo(Sprite(FlexGlobals.topLevelApplication), "Information", tmp);
				}
				else if (errorServer.type == TypeException.ERROR)
				{
					var buildMsg:String = CodeConverter.getMessage(errorServer.code, errorServer.params);
					var sMsg:String = "";
					if (errorServer.message != "")
					{
						sMsg = errorServer.message;
					}
					MsgBox.showError(Sprite(FlexGlobals.topLevelApplication), "Erreur", buildMsg, sMsg + errorServer.stack);
				}
			}
		}

		// Display the error
		public static function displayErrorMessage(message:String):void
		{
			// TODO: Customize error message
			Alert.show(message);
		}

	}
}
