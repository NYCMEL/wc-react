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

var tkSession = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-11-26 10:46:16 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("tkSession.init: " + options.id + ", " + options.seed);
	
	try {
	    var isFirst = $.cookie(options.id);
	}
	catch(e) {
	    console.log(e.name + ' > ' + e.message);
	    return;
	}
	
	if (isFirst == null || isFirst == 'undefined') {
	    $.cookie(options.id, options.id + "." + options.seed);
	    
	    console.log("SESSION SET: " + options.id + ", " + $.cookie(options.id));
	    
	    // RELOAD THE PAGE WITH COOKIE SET
	    document.location.reload();
	}
	
	//ma.event({type:'SESSION', custom:'session cookie'});

	console.groupEnd();
    }
};
