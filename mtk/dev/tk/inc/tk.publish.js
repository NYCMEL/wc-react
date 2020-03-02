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

// JUST IN CASE TK IS DEFINED OUTSIDE
var tk = tk || {};

/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2014-11-26 10:46:16 (melify)>
/////////////////////////////////////////////////////////////////////////////
tk.publish = function(options){
    console.group("tk.publish");

    $("[type=button], [type=radio], [type=checkbox]").on("click", function() {
	var id   = $(this).attr("id");
	var type = $(this).attr("type");

	jQuery.publish(type, ['clicked', id]); // PUBLISH
    });

    $("select").on("change", function() {
	var id    = $(this).attr("id");
	var type  = "select";

	jQuery.publish(type, ['changed', id]); // PUBLISH
    });

    console.groupEnd();
}

