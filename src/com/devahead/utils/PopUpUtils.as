/*
 * Copyright (c) 2009, Andrea Bresolin (http://www.devahead.com)
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer;
 * - redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - neither the name of www.devahead.com nor the names of its contributors may
 *   be used to endorse or promote products derived from this software without
 *   specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS”
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

package com.devahead.utils
{
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.core.IChildList;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	public class PopUpUtils
	{
		/**
		 * Returns all the popups inside an application. Only the popups whose base
		 * class is UIComponent are returned.
		 * 
		 * @param applicationInstance
		 *   Application instance. If null, Application.application is used.
		 * @param onlyVisible
		 *   If true, considers only the visible popups.
		 * @return All the popups in the specified application.
		 */
		
		public static function isOpen(component:UIComponent):Boolean
		{
			for each (var uic:UIComponent in getAllPopups())
			{
				if(uic === component)
				{
					return true;
				}
			}
			return false;
		}
		
		
		public static function getAllPopups(applicationInstance: Object = null,
			onlyVisible: Boolean = false): ArrayCollection
		{
			var result: ArrayCollection = new ArrayCollection();
			
			if (applicationInstance == null)
			{
				applicationInstance = Application.application;
			}
			
			var rawChildren: IChildList = applicationInstance.systemManager.rawChildren;
			
			for (var i: int = 0; i < rawChildren.numChildren; i++)
			{
				var currRawChild: DisplayObject = rawChildren.getChildAt(i);
				
				if ((currRawChild is UIComponent) && UIComponent(currRawChild).isPopUp)
				{
					if (!onlyVisible || UIComponent(currRawChild).visible)
					{
						result.addItem(currRawChild);
					}
				}
			}
			
			return result;
		}

		/**
		 * Checks if an application has visible popups. Only the popups whose base
		 * class is UIComponent are considered.
		 * 
		 * @param applicationInstance
		 *   Application instance. If null, Application.application is used.
		 * @return True if there are visible popups in the specified application,
		 *         false otherwise.
		 */
		public static function hasVisiblePopups(applicationInstance: Object = null): Boolean
		{		
			if (applicationInstance == null)
			{
				applicationInstance = Application.application;
			}

			var rawChildren: IChildList = applicationInstance.systemManager.rawChildren;
			
			for (var i: int = 0; i < rawChildren.numChildren; i++)
			{
				var currRawChild: DisplayObject = rawChildren.getChildAt(i);
				
				if ((currRawChild is UIComponent) && UIComponent(currRawChild).isPopUp
					&& UIComponent(currRawChild).visible)
				{
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Closes all the popups belonging to an application. Only the popups
		 * whose base class is UIComponent are considered.
		 * 
		 * @param applicationInstance
		 *   Application instance. If null, Application.application is used.
		 * @return The list of the closed popups.
		 */
		public static function closeAllPopups(applicationInstance: Object = null): ArrayCollection
		{
			var allPopups: ArrayCollection = getAllPopups(applicationInstance);
			
			for each (var currPopup: UIComponent in allPopups)
			{
				PopUpManager.removePopUp(currPopup);
			}
			
			return allPopups;
		}
	}
}