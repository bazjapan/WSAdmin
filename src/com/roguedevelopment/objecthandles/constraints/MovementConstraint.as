/**
 *  Latest information on this project can be found at http://www.rogue-development.com/objectHandles.html
 * 
 *  Copyright (c) 2009 Marc Hughes 
 * 
 *  Permission is hereby granted, free of charge, to any person obtaining a 
 *  copy of this software and associated documentation files (the "Software"), 
 *  to deal in the Software without restriction, including without limitation 
 *  the rights to use, copy, modify, merge, publish, distribute, sublicense, 
 *  and/or sell copies of the Software, and to permit persons to whom the Software 
 *  is furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all 
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 *  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
 *  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
 *  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
 *  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 *  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
 * 
 *  See README for more information.
 * 
 **/
 
package com.roguedevelopment.objecthandles.constraints
{
	import com.roguedevelopment.objecthandles.DragGeometry;
	import com.roguedevelopment.objecthandles.HandleRoles;
	import com.roguedevelopment.objecthandles.IConstraint;
	
	import flash.geom.Rectangle;
	/**
	 * This is a constraint that makes an object stay within a certain bounds.
	 * 
	 * This isn't really done yet.  It doesn't handle rotated objects well
	 **/
	public class MovementConstraint implements IConstraint
	{
		public var minX:Number;
		public var minY:Number;
		public var maxX:Number;
		public var maxY:Number;

		public function applyConstraint( original:DragGeometry, translation:DragGeometry, resizeHandleRole:uint ) : void
		{
			// Both are required for the logic to work
			if(!original || !translation) return;
			
			var bounds:Rectangle = original.bounds;

			if(!isNaN(maxX))
			{
				if((bounds.x + translation.x + bounds.width +
					translation.width) > maxX)
				{
					if(HandleRoles.isMove(resizeHandleRole))
					{
						translation.x = maxX - (bounds.x + bounds.width);
					}
					else if(HandleRoles.isResizeRight(resizeHandleRole))
					{
						translation.width = maxX - (bounds.x + translation.x +
							bounds.width);
						
					}
				}
			}
			
			if(!isNaN(maxY))
			{
				if((bounds.y + translation.y + bounds.height +
					translation.height) > maxY)
				{
					if(HandleRoles.isMove(resizeHandleRole))
					{
						translation.y = maxY - (bounds.y + bounds.height);
					}
					else if(HandleRoles.isResizeDown(resizeHandleRole))
					{
						translation.height = maxY - (bounds.y + translation.y +
							bounds.height);
						
					}
				}
			}
			
			if(!isNaN(minX))
			{
				if((bounds.x + translation.x) < minX)
				{
					translation.x = minX - bounds.x;
				}
				if(HandleRoles.isResizeLeft(resizeHandleRole) && bounds.x -
					translation.width < minX)
				{
					translation.width = - minX + bounds.x;
				}
			}
			
			if(!isNaN(minY))
			{
				if((bounds.y + translation.y) < minY)
				{
					translation.y = minY - bounds.y;
				}
				if(HandleRoles.isResizeUp(resizeHandleRole) && bounds.y -
					translation.height < minY)
				{
					translation.height = - minY + bounds.y;
				}
				
			}
		}

	}
}
