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

////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2014-06-27 10:07:35 (a527951)>
////
////   usage:
////     $('#x').mtk();                 // init
////     $('#x').mtk('color','brown');  // change color
////
////////////////////////////////////////////////////////////////////////////
(function($) {
    var methods = {
	////////////////////////////////////////////////////////////////////
	////
	////////////////////////////////////////////////////////////////////
	init : function(options) {
	    console.group("mtk.init" + tk.obj2str(options));

	    $.cookie("app", options.app);
	    $.cookie("env", options.env);

	    console.groupEnd();
	    return this;
	},

	////////////////////////////////////////////////////////////////////
	////
	////////////////////////////////////////////////////////////////////
	center : function() {
	    console.group("mtk.center");

	    t = Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop());
	    l = Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft());

	    this.css("position","absolute");
	    this.css("top",  t);
	    this.css("left", l);

	    console.log("top:" + t + ", left:" + l);

	    console.groupEnd();
	    return this;
	},

	////////////////////////////////////////////////////////////////////
	////
	////////////////////////////////////////////////////////////////////
	background : function(color) {
	    console.group("mtk.color");

	    this.css("background", color);

	    console.groupEnd();
	    return this;
	},
    };

    ////////////////////////////////////////////////////////////////////////
    //// DO NOT TOUCH ... DO NOT TOUCH ... DO NOT TOUCH ... DO NOT TOUCH 
    ////////////////////////////////////////////////////////////////////////
    $.fn.mtk = function( method ) {
	if ( methods[method] ) {
	    return methods[method].apply( this, Array.prototype.slice.call( arguments, 1 ));
	} else if ( typeof method === "object" || ! method ) {
	    return methods.init.apply( this, arguments );
	} else {
	    console.error( "Method " +  method + " does not exist on jQuery.mtk" );
	}
    };
})( jQuery );
