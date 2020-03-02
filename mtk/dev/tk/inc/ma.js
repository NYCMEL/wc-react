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

var ma = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-11-26 12:32:19 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function() {
	console.group("ma.init");

	jQuery(document).ready(function() {
	    // CREATE A DUMMY DIV
	    if ($(".ma").length == 0) {
		$("body").append("<div class=ma></div>");
	    }

	    // MAKE PAGE VISIBLE
	    $("body").css("display","block");
	    
	    // HIDE ADDRESS LINE
	    window.scrollTo(0, 1);

	    // ADD LISTENER EVENTS
	    $(document).bind("click", ma.event);
	});

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    event: function(e) {
	console.group("ma.event");

	//if (e.type != "click" && e.type != "A" && e.type != "INPUT" && e.type != "SESSION") return false;

	console.log("Event Type: "  ,   e.type);
	console.log("Event Target: ", e.target);
	console.log("EVENT CUSTOM: ", e.custom);

	if (e.custom == undefined) {
	    var custom = $(e.target).attr("title");

	    if (typeof custom == "undefined") {
		custom = e.type;
	    }
	} else {
	    custom = e.custom;
	}
	
	var url = 
	    "http://ma.melify.com/img/ma.png?app=" + app.name +
	    "&env="       + app.env +
	    "&page="      + app.page +
	    "&custom="    + escape(custom)

	//console.log("url('" + url + "')");
	    
	$(".ma").css("background-image", "url('" + url + "')");

	console.groupEnd();
    }
}

ma.init();
