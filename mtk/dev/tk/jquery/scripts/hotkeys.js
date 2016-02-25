var ctrl_c_showing = 0;
var ctrl_d_showing = 0;
var ctrl_s_showing = 0;
var ctrl_e_showing = 0;
var ctrl_h_showing = 0;

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function tkShowComponents(key,flag,display) {
    console.group(key + " " + display);

    switch(key)
    {
    case "ctrl+c":
	processCtrlC(flag,display);
	break;
	
    case "ctrl+d":
	processCtrlD(flag,display);
	break;
	
    case "ctrl+s":
	processCtrlS(flag,display);
	break;
	
    case "ctrl+e":
	processCtrlE(flag,display);
	break;

    case "ctrl+h":
        processCtrlH(flag,display);
	break;
    }

    console.groupEnd();
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function processCtrlC(flag,display) {
    debug.log("processCtrlC: " + flag + " " + display);

    if (flag) {
	jQuery(display).each(function() {
	    var obj = jQuery(this);
	    var cls = obj.attr("class");
	    var id  = obj.attr("id");

	    $("#" + id).addClass("tk-show-component")

	    if (ctrl_c_showing == 0) {
		var first = cls.split(' ')[1];

		jQuery("." + first)
		    .css("position","relative")
		    .append("<span style=font-size:12px;position:absolute;top:0;left:0;z-index:10;color:red;padding:0px class='ctrl_c_showing'>" + first + " | " + id + "</span>");
	    }
	});

	ctrl_c_showing = 1;
    } else {
	jQuery(display).each(function() {
	    var obj = jQuery(this);
	    var id  = obj.attr("id");
	    
	    $("#" + id).removeClass("tk-show-component")

	    jQuery(".ctrl_c_showing").remove();
	});

	ctrl_c_showing = 0;
    }
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function processCtrlD(flag,display) {
    debug.log("processCtrlD: " + flag + " " + display);

    if (flag) {
	if (ctrl_d_showing == 0) {
	    jQuery("." + display).slideToggle('slow');
	    ctrl_d_showing = 1;
	} else {
	    jQuery("." + display).slideToggle('slow');
	    ctrl_d_showing = 0;
	}
    }
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function processCtrlS(flag,display) {
    debug.log("processCtrlS: " + flag + " " + display);

    if (flag) {
	if (ctrl_s_showing == 0) {
	    jQuery(".tk-slider").animate({width:'toggle'},100);

	    ctrl_s_showing = 1;
	}
    } else {
	ctrl_s_showing = 0;
    }
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function processCtrlE(flag,display) {
    console.group("processCtrlE: " + flag + " " + display);

    if (flag) {
	if (ctrl_e_showing == 0) {
	    jQuery(display).addClass("showme");
	    
	    ctrl_e_showing = 1;
	}
    } else {
	jQuery(display).removeClass("showme");
	
	ctrl_e_showing = 0;
    }

    console.groupEnd();
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function processCtrlH(flag,display) {
    console.group("processCtrlH: " + flag + " " + display);

    //var links = jQuery(".tk-hotspot, a:not([href^=javascript]):not([href^=#])");
    var links = jQuery(".tk-hotspot, a");

    if (ctrl_h_showing == 0) {
	debug.log("adding tk-show-hotspot class...");
	links.addClass("tk-show-hotspot");

	ctrl_h_showing = 1;
    } else {
	debug.log("removeing tk-show-hotspot.");
	links.removeClass("tk-show-hotspot");

	ctrl_h_showing = 0;
    }

    console.groupEnd();
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function tkHotKeysInit(key,display) {
    //console.group("tkHotKeysInit");

    switch(key)
    {
    case "ctrl+e" :
	jQuery(document).bind('keydown', key, function(){   
	    tkEditable(key,1,display);
	});
	
	jQuery(document).bind('keyup', key, function(){   
	    tkEditable(key,0,display);
	});
	break;

    case "ctrl+h" :
	jQuery(document).bind('keydown', key, function(){   
	    tkShowComponents(key,1,display);
	});
	break;

    default:
	jQuery(document).bind('keydown', key, function(){   
	    tkShowComponents(key,1,display);
	});
	
	jQuery(document).bind('keyup', key, function(){   
	    tkShowComponents(key,0,display);
	});
	break;
    }

    //console.groupEnd();
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
tkHotKeysInit("ctrl+c","component");
tkHotKeysInit("ctrl+d","tk-bugger");
tkHotKeysInit("ctrl+s","tk-slider");
tkHotKeysInit("ctrl+h","tk-hotspot");
tkHotKeysInit("ctrl+e","e");
tkHotKeysInit("ctrl+e","editable");

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
function tkEditable(key,flag,display) {
    console.group("tkEditable");

    if (flag) {
	if (ctrl_e_showing == 0) {
	    //jQuery(display).css("border","3px gold solid");
	    jQuery(display).addClass("showme");

	    ctrl_e_showing = 1;
	}
    } else {
	jQuery(display).removeClass("showme");
	
	ctrl_e_showing = 0;
    }

    console.groupEnd();
}

////////////////////////////////////////////////////////////////
//// 
////////////////////////////////////////////////////////////////
jQuery(document).ready(function() {
    $("e").click(function(e) {
	if (e.altKey) {
	    event.preventDefault();
	    
	    jQuery("#tk-dummy").load("/mtk/render?ajax=1&callback=tk::editable::show&id=" + jQuery(this).attr("id"));
	}
    });
});

