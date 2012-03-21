// designed and developed by Mike Delucchi . Zanuka . mike@zanuka.com

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
		
		
		private function checkFocusIN(e:Event):void
		{
			var checkName:String = e.target.name;
			
			_currentCheckBox = e.target.valueOf();
			
			var checkBoxCatNum:Number = Number(getCheckCatNum(checkName)); // just give us '2' from 'cat2_1'
			_catNum = checkBoxCatNum;
			
			var bitValue:Number = Number(getCatBitValue(checkName));

			if (_currentCheckBox.selected == false) { 			// if it's selected, you get positive bitValue, if not,,, negative to subract
				bitValue = -bitValue;
			}
			
			calcMaskBits(checkBoxCatNum, bitValue);			
		}
		
		private function calcMaskBits(cat:Number, bit:Number):void
		{
			switch (cat)
			{
				case 1 : 
					_cat1MaskBits = _cat1MaskBits + bit;	
					break;
				case 2 : 
					_cat2MaskBits = _cat2MaskBits + bit;	
					break;
				case 3 : 
					_cat3MaskBits = _cat3MaskBits + bit;	
					break;
				case 4 : 
					_cat4MaskBits = _cat4MaskBits + bit;	
					break;
				case 5 : 
					_cat5MaskBits = _cat5MaskBits + bit;	
					break;
				case 6 : 
					_cat6MaskBits = _cat6MaskBits + bit;	
					break;
				case 7 : 
					_cat7MaskBits = _cat7MaskBits + bit;	
					break;
				case 8 : 
					_cat8MaskBits = _cat8MaskBits + bit;	
					break;
				case 9 : 
					_cat9MaskBits = _cat9MaskBits + bit;	
					break;
				case 10 : 
					_cat0MaskBits = _cat0MaskBits + bit;	
					break;
			}
			
			updateResults();
			
		}
		
		
		private function textFocusIN(e:FocusEvent):void
		{
			var inputName:String = e.target.name;
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
			updateDisplays();
			updateResults();
		}
		
		private function updateDisplays():void
		{
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
					_screen.result4.text = _input4String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat4MaskBits + ' }'
					break;
				case 5 :
					catBitValue = 16;
					_screen.result5.text = _input5String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat5MaskBits + ' }'
					break;
				case 6 :
					catBitValue = 32;
					_screen.result6.text = _input6String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat6MaskBits + ' }'
					break;
				case 7 :
					catBitValue = 64;
					_screen.result7.text = _input7String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat7MaskBits + ' }'
					break;
				case 8 :
					catBitValue = 128;
					_screen.result8.text = _input8String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat8MaskBits + ' }'
					break;
				case 9 :
					catBitValue = 256;
					_screen.result9.text = _input9String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat9MaskBits + ' }'
					break;
				case 0 :
					catBitValue = 512;
					_screen.result10.text = _input0String+ 'CollisionFilter = { categoryBits = ' + catBitValue + ', maskBits = ' + _cat0MaskBits + ' }'
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
			
			_screen.cat4_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat4_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat5_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat5_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat6_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat6_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat7_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat7_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat8_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat8_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat9_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat9_512.addEventListener(Event.CHANGE, checkFocusIN);
			
			_screen.cat0_1.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_2.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_4.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_8.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_16.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_32.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_64.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_128.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_256.addEventListener(Event.CHANGE, checkFocusIN);
			_screen.cat0_512.addEventListener(Event.CHANGE, checkFocusIN);
		}
		
		
		// NEATO BURRITO VALUE-RETURNING UTLITY FUNCTIONS 		
		
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