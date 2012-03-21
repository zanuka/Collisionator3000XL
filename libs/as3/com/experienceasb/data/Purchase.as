package com.experienceasb.data 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jeff Nusz
	 */
	public class Purchase 
	{
		public var mc:MovieClip;
		public var name:String;
		public var cost:Number;
		public var category:Number;
		
		public function Purchase(in_name:String, in_cost:Number, in_category:Number = -1 ) 
		{
			name = in_name;
			cost = in_cost;
			category = in_category;
		}
		public function toString():String 
		{
			return "[Purchase mc=" + mc + " name=" + name + " cost=" + cost + " category=" + category + "]";
		}
	}

}