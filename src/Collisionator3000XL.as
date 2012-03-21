// created by Mike Delucchi . Zanuka . mike@zanuka.com

package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.FastEase;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.text.TextField;
	import flash.utils.setTimeout;
	
	[SWF(width='1050',height='600',frameRate='31',backgroundColor='#FFFFFF')]
	
	public class Collisionator3000XL extends Sprite
	{
		
		private var _screen:AssetCollisionator = new AssetCollisionator;
		
		private var _catNum:Number = 0;
		private var _currentInput:TextField;
		private var _currentCatString:String = '';
		
		public function Collisionator3000XL()
		{
			
			this.addEventListener(Event.ADDED_TO_STAGE,  init);
		}
		
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			createScreen();
			addEventListeners();
		}
		
		
		private function createScreen():void
		{
			addChild(_screen);
		}
		
		private function addEventListeners():void 																		// SETUP ALL FIELD LISTENERS... 
		{
			_screen.input1.addEventListener(Event.CHANGE, calculateIT);
			_screen.input2.addEventListener(Event.CHANGE, calculateIT);
			_screen.input3.addEventListener(Event.CHANGE, calculateIT);
			_screen.input4.addEventListener(Event.CHANGE, calculateIT);
			_screen.input5.addEventListener(Event.CHANGE, calculateIT);
			_screen.input6.addEventListener(Event.CHANGE, calculateIT);
			_screen.input7.addEventListener(Event.CHANGE, calculateIT);
			_screen.input8.addEventListener(Event.CHANGE, calculateIT);
			_screen.input9.addEventListener(Event.CHANGE, calculateIT);
			_screen.input10.addEventListener(Event.CHANGE, calculateIT);
			
			_screen.input1.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input2.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input3.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input4.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input5.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input6.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input7.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input8.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input9.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			_screen.input10.addEventListener(FocusEvent.FOCUS_IN, focusIN);
			
		}
		
		
		private function focusIN(e:FocusEvent):void
		{
			var inputString:String = e.target.name;
			_currentInput = e.target.valueOf();
			_catNum = Number(getLastChar(inputString));
			
			switch (_catNum)
			{
				case 1 :
					_screen.input1.text = '';
					_screen.display1.text = '';
					break;
				case 2 :
					_screen.input2.text = '';
					_screen.display2.text = '';
					break;
				case 3 :
					_screen.input3.text = '';
					_screen.display3.text = '';
					break;
				case 4 :
					_screen.input4.text = '';
					_screen.display4.text = '';
					break;
				case 5 :
					_screen.input5.text = '';
					_screen.display5.text = '';
					break;
				case 6 :
					_screen.input6.text = '';
					_screen.display6.text = '';
					break;
				case 7 :
					_screen.input7.text = '';
					_screen.display7.text = '';
					break;
				case 8 :
					_screen.input8.text = '';
					_screen.display8.text = '';
					break;
				case 9 :
					_screen.input9.text = '';
					_screen.display9.text = '';
					break;
				case 0 :
					_screen.input10.text = '';
					_screen.display10.text = '';
					break;
			}
			
		}
		
		private function calculateIT(e:Event):void 																			// PRIMARY CALCULATION FUNCTION	
		{
			_currentCatString = _currentInput.text;
			
			trace ('catNum = ' + _catNum);
			
			trace ('currentCatString = ' + _currentCatString);
			
			// populate the top displays...
			switch (_catNum)
			{
				case 1 :
					_screen.display1.text = '' + _currentCatString;
					break;
				case 2 :
					_screen.display2.text = '' + _currentCatString;
					break;
				case 3 :
					_screen.display3.text = '' + _currentCatString;
					break;
				case 4 :
					_screen.display4.text = '' + _currentCatString;
					break;
				case 5 :
					_screen.display5.text = '' + _currentCatString;
					break;
				case 6 :
					_screen.display6.text = '' + _currentCatString;
					break;
				case 7 :
					_screen.display7.text = '' + _currentCatString;
					break;
				case 8 :
					_screen.display8.text = '' + _currentCatString;
					break;
				case 9 :
					_screen.display9.text = '' + _currentCatString;
					break;
				case 0 :
					_screen.display10.text = '' + _currentCatString;
					break;
			}
			
			
			
			// populate the collision filter items
//			cat1CollisionFilter = { categoryBits = 1, maskBits = 14 }
			
		}
		
		
		private function resultFocusIN(e:FocusEvent):void																	// RESULT FIELDS - FOR COPYING / PASTING
		{
			setTimeout(e.target.setSelection, 50, 0, e.target.text.length); // we put delay on the focusIN event so that it will select all and you can copy to clipboard
		}

		private function resultFocusOUT(e:FocusEvent):void
		{	
			e.target.setSelection(0,0);
			
		}
		
		
		
//		There's a dynamic textfield on stage which holds some text. I wanted to achieve a "Select all the text as soon as the user (single-)clicks on it" - this surely is a bit unorthodox, but there was a reason for that. At first I didn't think of any problems that could occur, but as usual I was surprised by Flash again.
		
		
		private function getLastChar(s:String):String
		{
			return s.substr(s.length-1,s.length);
		}
		
	}
}