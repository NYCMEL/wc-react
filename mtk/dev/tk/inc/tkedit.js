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

var tke = {
    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-06-21 21:04:28 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("tke.init");

	//GOOGLE TRACKER
	tk.tracker("tke");

	jQuery("e").addClass("editable");

	console.groupEnd("tke.init");
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    save: function(id) {
	console.log("tke.save: " + id);

	tk.load(".tk-dummy","/mtk/render?callback=tke::save&id=" + id + "&value=" + escape($("#" + id).html()));
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    wcheck: function() {
	console.log("tke.edits");
	
	console.log("editables: " + jQuery("e").length);

	jQuery("e").each(function() {
	    obj = $(this);
	    id  = obj.attr("id");
	    val = obj.html();

	    tk.load(".tk-dummy","/mtk/render?callback=tke::restore&id=" + id + "&val=" + escape(val));
	});
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    check: function() {
	console.group("tke.edits");
	
	console.log("editables: " + jQuery("e").length);

	var ids = ""

	jQuery("e").each(function() {
	    ids += $(this).attr("id") + ","
	});

	console.log("IDS: " + ids);

	tk.load(".tk-dummy","/mtk/render?callback=tke::restore&ids=" + ids);

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    tkedit: function() {
	console.log("tke.tkedit");

	edit = jQuery.cookie("tkedit");

	if (edit == "null") {
	    jQuery.cookie("tkedit","1");
	} else {
	    jQuery.cookie("tkedit",null);
	}

	document.location.reload();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    showEdits: function() {
	console.log("tke.showEdits");
	
	if (jQuery("e").hasClass("tkedit-bg")) {
	    jQuery("e").removeClass("tkedit-bg");
	} else {
	    jQuery("e").addClass("tkedit-bg");
	}
    }
}
