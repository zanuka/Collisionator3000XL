package com.experienceasb.helper 
{
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * ...
	 * @author Jeff Nusz
	 */
	public class Helpers 
	{
		
		public function Helpers() 
		{
			
		}
		
		static public function setupButton(button:SimpleButton, onClick:Function):void 
		{
			button.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		static public function numberFormat(number:*, maxDecimals:int = 2, forceDecimals:Boolean = true, siStyle:Boolean = false):String {
			var i:int = 0, inc:Number = Math.pow(10, maxDecimals), str:String = String(Math.round(inc * Number(number))/inc);
			var hasSep:Boolean = str.indexOf(".") == -1, sep:int = hasSep ? str.length : str.indexOf(".");
			var ret:String = (hasSep && !forceDecimals ? "" : (siStyle ? "," : ".")) + str.substr(sep+1);
			if (forceDecimals) for (var j:int = 0; j <= maxDecimals - (str.length - (hasSep ? sep-1 : sep)); j++) ret += "0";
			while (i + 3 < (str.substr(0, 1) == "-" ? sep-1 : sep)) ret = (siStyle ? "." : ",") + str.substr(sep - (i += 3), 3) + ret;
			return str.substr(0, sep - i) + ret;
		}
		
		static public function gotoExternalPage(url:String):void 
		{
			var request:URLRequest = new URLRequest(url);
			
			try {
				navigateToURL(request, '_blank');
			}
			catch (e:Error) {
				
			}
		}

		static public function gotoInternalPage(hash:String):void 
		{
			if (ExternalInterface.available) {
				ExternalInterface.call('_gotoHashtag',hash);
			}
		}
		
		
		static public function randomIndex(low:Number = 0, high:Number = 1):Number {
			return Math.floor(Math.random() * (1+high-low)) + low;
		}
		
		static public function randomNumber(low:Number = 0, high:Number = 1):Number {
			return (Math.random() * (high-low)) + low;
		}
		
		static public function removeItemArray(thearray:Array , theItem:*):void{
			//trace("Remove "+theItem+" from "+thearray );
			for(var i:int=0; i<thearray .length;i++){
				if(thearray [i]==theItem){
					thearray .splice(i,1);
					break;
				}
			}
			//trace("Your array is now - "+thearray );
		}
	}

}