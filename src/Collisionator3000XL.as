// created by Mike Delucchi . Zanuka . mike@zanuka.com

package
{
	import com.greensock.TweenMax;
	import com.greensock.easing.FastEase;
	
	import fl.controls.CheckBox;
	
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
		private var _currentInputTF:TextField;
		private var _currentCheckBox:CheckBox;
		private var _currentCatString:String = '';
		private var _cat1MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		
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
			_screen.input1.addEventListener(Event.CHANGE, updateInputData);
			_screen.input2.addEventListener(Event.CHANGE, updateInputData);
			_screen.input3.addEventListener(Event.CHANGE, updateInputData);
			_screen.input4.addEventListener(Event.CHANGE, updateInputData);
			_screen.input5.addEventListener(Event.CHANGE, updateInputData);
			_screen.input6.addEventListener(Event.CHANGE, updateInputData);
			_screen.input7.addEventListener(Event.CHANGE, updateInputData);
			_screen.input8.addEventListener(Event.CHANGE, updateInputData);
			_screen.input9.addEventListener(Event.CHANGE, updateInputData);
			_screen.input10.addEventListener(Event.CHANGE, updateInputData);
			
			_screen.input1.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input2.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input3.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input4.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input5.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input6.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input7.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input8.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input9.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			_screen.input10.addEventListener(FocusEvent.FOCUS_IN, textFocusIN);
			
			_screen.cat1_1.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_2.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_4.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_8.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_16.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_32.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_64.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_128.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_256.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			_screen.cat1_512.addEventListener(FocusEvent.FOCUS_IN, check1FocusIN);
			
			
		}
		
		private function check1FocusIN(e:FocusEvent):void
		{
			var checkName:String = e.target.name;
			trace ('checkName = ' + checkName);
			
			_catNum = 1;
			
			_currentCheckBox = e.target.valueOf();
			
			var bitValue:Number = Number(getCatBitValue(checkName));
			
			trace ('bitValue = ' + bitValue);
			
			// now we add to the _cat1MaskBits number
			
			_cat1MaskBits = _cat1MaskBits + bitValue;
			
			trace ('_catMaskBits = ' + _cat1MaskBits);
			
			calcuTron();
			
			
		}
		
		
		private function textFocusIN(e:FocusEvent):void
		{
			var inputName:String = e.target.name;
			
			trace ('inputName = ' + inputName);
			
			_currentInputTF = e.target.valueOf();
			_catNum = Number(getLastChar(inputName));
			
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
		
		private function updateInputData(e:Event):void 																			// PRIMARY CALCULATION FUNCTION	
		{
			_currentCatString = _currentInputTF.text;
			
			trace ('catNum = ' + _catNum);
			
			trace ('currentCatString = ' + _currentCatString);
			
			calcuTron();
			
			
		}
		
		private function calcuTron():void
		{
			// populate the top displays...
			var catBitValue:Number;
			switch (_catNum)
			{
				case 1 :
					catBitValue = 1;
					_screen.display1.text = '' + _currentCatString;
					_screen.result1.text = _currentCatString + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat1MaskBits + ' }'
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
		}
		
		
		private function resultFocusIN(e:FocusEvent):void																	// RESULT FIELDS - FOR COPYING / PASTING
		{
			setTimeout(e.target.setSelection, 50, 0, e.target.text.length); // we put delay on the focusIN event so that it will select all and you can copy to clipboard
		}

		private function resultFocusOUT(e:FocusEvent):void
		{	
			e.target.setSelection(0,0);
			
		}
		
		
		// VALUE-RETURNING UTLITY FUNCTIONS 		
		
		private function getCatName(s:String):String // here we just want to extract 'cat1' from 'cat1_
		{
			return s.substr(0,4);
		}

		private function getLastChar(s:String):String
		{
			return s.substr(s.length-1,s.length);
		}

		private function getCatBitValue(s:String):String // here we want to extract 32 from 'cat1_32'...
		{
			return s.substr(5,s.length);
			
		}
		
	}
}