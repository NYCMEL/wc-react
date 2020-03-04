////HEADS///////////////////////////////////////////////////////////////////
//
//  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
//  
//  This program is free software: you can redistribute it and//or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see http://www.gnu.org/licenses.
//
////HEADE/////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
//// 
//////////////////////////////////////////////////////////////////////////////
(function ($) {
    $.fn.wait = function (handler, shouldRunHandlerOnce, isChild) {
	var found       = 'found';
	var $this       = $(this.selector);
	var $elements   = $this.not(function () {return $(this).data(found);}).each(handler).data(found, true);
	var interval    = 50;
	
	if (!isChild) {
	    (window.wait_Intervals = window.wait_Intervals || {})
	    [this.selector] = window.setInterval(function () {
		$this.wait(handler, shouldRunHandlerOnce, true); 
		console.log("waiting for element...");
	    }, interval);
	} else if (shouldRunHandlerOnce && $elements.length) {
	    window.clearInterval(window.wait_Intervals[this.selector]);
	    console.log("cleared interval");
	}

	return $this;
    }
}(jQuery));

// ------------------------------------------------
// USAGE
// ------------------------------------------------
//     jQuery("#test").wait(function() {
//     }, 1);
