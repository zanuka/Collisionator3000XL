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
//		private var _catName:Number = 0;
		private var _currentInputTF:TextField;
		private var _currentCheckBox:CheckBox;
		private var _currentCatString:String = '';
		private var _input1String:String = '';
		private var _input2String:String = '';
		private var _input3String:String = '';
		private var _input4String:String = '';
		private var _input5String:String = '';
		private var _input6String:String = '';
		private var _input7String:String = '';
		private var _input8String:String = '';
		private var _input9String:String = '';
		private var _input0String:String = '';
		
		
		
		private var _cat1MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat2MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat3MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat4MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat5MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat6MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat7MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat8MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat9MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		private var _cat0MaskBits:Number = 0; 																			// total sum of all category collision bit values in that row
		
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
			
			_screen.cat1_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat1_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat2_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat2_512.addEventListener(Event.CHANGE, checkFocusIN);

			_screen.cat3_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat3_512.addEventListener(Event.CHANGE, checkFocusIN);
			
		}
		
		private function checkFocusIN(e:Event):void
		{
			var checkName:String = e.target.name;
			trace ('\ncheckName = ' + checkName);
			
			_currentCheckBox = e.target.valueOf();
			
			var checkBoxCatNum:Number = Number(getCheckCatNum(checkName)); // just give us '2' from 'cat2_1'
			_catNum = checkBoxCatNum;
			
			var bitValue:Number = Number(getCatBitValue(checkName));
			trace ('_currentCheckBox = ' + _currentCheckBox.selected);

			if (_currentCheckBox.selected == false) { 			// if it's selected, you get positive bitValue, if not,,, negative to subract
				bitValue = -bitValue;
			}
			
			// we also need to get the current text from the input value of this cat row
			
//			_currentInputTF = e.target.valueOf();
			
			
			
			
			calcMaskBits(checkBoxCatNum, bitValue);			
			
		}
		
		private function calcMaskBits(cat:Number, bit:Number):void
		{
			switch (cat)
			{
				case 1 : 
					_cat1MaskBits = _cat1MaskBits + bit;	
					trace ('_cat1MaskBits = ' + _cat1MaskBits);
					break;
				case 2 : 
					_cat2MaskBits = _cat2MaskBits + bit;	
					trace ('_cat2MaskBits = ' + _cat2MaskBits);
					break;
				case 3 : 
					_cat3MaskBits = _cat3MaskBits + bit;	
					trace ('_cat3MaskBits = ' + _cat3MaskBits);
					break;
			}
			
//			updateDisplays();
			updateResults();
			
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
			
			updateDisplays();
//			updateResults();
			
			
		}
		
		private function updateDisplays():void
		{
			// populate the top displays...
			var catBitValue:Number;
			switch (_catNum)
			{
				case 1 :
					catBitValue = 1;
					_screen.display1.text = '' + _currentCatString;
					_input1String = _currentCatString;
					break;
				case 2 :
					catBitValue = 2;
					_screen.display2.text = '' + _currentCatString;
					_input2String = _currentCatString;
					break;
				case 3 :
					catBitValue = 4;
					_screen.display3.text = '' + _currentCatString;
					_input3String = _currentCatString;
					break;
				case 4 :
					catBitValue = 8;
					_screen.display4.text = '' + _currentCatString;
					_input4String = _currentCatString;
					break;
				case 5 :
					catBitValue = 16;
					_screen.display5.text = '' + _currentCatString;
					_input5String = _currentCatString;
					break;
				case 6 :
					catBitValue = 32;
					_screen.display6.text = '' + _currentCatString;
					_input6String = _currentCatString;
					break;
				case 7 :
					catBitValue = 64;
					_screen.display7.text = '' + _currentCatString;
					_input7String = _currentCatString;
					break;
				case 8 :
					catBitValue = 128;
					_screen.display8.text = '' + _currentCatString;
					_input8String = _currentCatString;
					break;
				case 9 :
					catBitValue = 256;
					_screen.display9.text = '' + _currentCatString;
					_input9String = _currentCatString;
					break;
				case 0 :
					catBitValue = 512;
					_screen.display10.text = '' + _currentCatString;
					_input0String = _currentCatString;
					break;
			}
		}

		private function updateResults():void
		{
			// populate the results...
			var catBitValue:Number;
			switch (_catNum)
			{
				case 1 :
					catBitValue = 1;
					_screen.result1.text = _input1String + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat1MaskBits + ' }'
					break;
				case 2 :
					catBitValue = 2;
					_screen.result2.text = _input2String + 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat2MaskBits + ' }'
					break;
				case 3 :
					catBitValue = 4;
					_screen.result3.text = _input3String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat3MaskBits + ' }'
					break;
				case 4 :
					catBitValue = 8;
					break;
				case 5 :
					catBitValue = 16;
					break;
				case 6 :
					catBitValue = 32;
					break;
				case 7 :
					catBitValue = 64;
					break;
				case 8 :
					catBitValue = 128;
					break;
				case 9 :
					catBitValue = 256;
					break;
				case 0 :
					catBitValue = 512;
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
		
		private function getCheckCatNum(s:String):String // here we just want to extract 'cat1' from 'cat1_
		{
			return s.substr(3,1);
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