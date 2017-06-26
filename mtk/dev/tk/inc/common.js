////HEADS///////////////////////////////////////////////////////////////////////////
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
////HEADE/////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////
//// 
//////////////////////////////////////////////////////////////////////////////////////
var tk = {
    buffers:  [],
    siteurl: location.protocol + "//" + location.host + location.pathname,
    siteport: location.port,
    browser: navigator.userAgent,

    ////////////////////////////////////////////////////////////////////////////////////
    //// DATA BINDING FUNCTION
    ////////////////////////////////////////////////////////////////////////////////////
    bind: function(id, callback) {
	console.group("bind", id);

	// IF MODEL DOES NOT EXIST CREATE IT
	tk.model = tk.model || [];

	var watchable = DataBind.bind($('#' + id), tk.model);

	watchable.watch(callback);

	console.groupEnd();
    },

    //////////////////////////////////////////////////////////////////////////////////
    ////
    //////////////////////////////////////////////////////////////////////////////////
    init: function() {
	console.log("tk.init");

	tk.buffer();

	// tk._process("tk-loading");   // LOADING
	// tk._process("[dom-target]"); // DOM-TARGET
	// tk._process(".tk-pagelet");  // PAGELET

	// DO NOT TURN ON! HAVE ISSUES
	//tk._ctracker_();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// FLIP PAGES (Single Page App)  
    /////////////////////////////////////////////////////////////////////////////
    //
    // division id="${_id}" {
    // 	division id="${_id}-home" {
    // 	    h3 [url "[lorem 4]" "#" onclick="tk.flip('home','home-test','[URL page test]')"]
    // 	    tk::dummy::2
    // 	}
    // 	division id="${_id}-test" {
    // 	    # ADD ALL PAGES LIKE THIS ONE
    //      # THIS ONE IS FOR TEST
    // 	}
    // }
    //
    // javascript {
    // 	put [subst {
    // 	    tk.flip("${_id}","${_id}-guts");
    // 	}]
    // }
    /////////////////////////////////////////////////////////////////////////////
    flip: function(page, pagelet, url) {
	console.group("tk.flip: " + page + ", " + pagelet + ", " + url);

	// HIDE ALL DIVS IN PARENT
	jQuery("#" + page + " > div").hide(0);

	if (url) {
	    // LOAD IF URL EXIST
	    $("#" + pagelet).load(url).show(0);
	} else {
	    // FLIP THE PAGE
	    $("#" + pagelet).show(0);
	}

	console.groupEnd();
    },

    //////////////////////////////////////////////////////////////////////////////////
    //// 
    //////////////////////////////////////////////////////////////////////////////////
    randomColor: function() {
	console.group("tk.randomColor");

	var color= "#"+Math.floor(Math.random()*16777216).toString(16);
	return color;

	console.groupEnd();
    },

    //////////////////////////////////////////////////////////////////////////////////
    //// tk.RESTful(func, "/tk/samples/rest", {key:"USER_DATA",id:"1000"});
    //////////////////////////////////////////////////////////////////////////////////
    RESTful: function(callback, url, data) {
	console.log("tk.RESTful");

	jQuery.ajax({ 
	    async: false,
	    cache: true,
	    type: "GET",
	    dataType: "jsonp",
	    jsonpCallback: callback,
	    url: url,
	    data: data,
	    success: function(data) {
		console.log("SUCCESS: " + tk.obj2str(data));
	    },
	    error: function (xhr, ajaxOptions, thrownError) {
		console.log(xhr.status + " | " + thrownError + " | " + ajaxOptions);
	    }
	});
    },

    //////////////////////////////////////////////////////////////////////////////////
    ////
    //////////////////////////////////////////////////////////////////////////////////
    submit: function(form,target) {
	console.log("tk.submit: " + form + " " + target);

	jQuery("#" + form).submit(function() {
	    jQuery.post(jQuery(this).attr("action"), jQuery(this).serialize(), function(html) {
		jQuery("#" + target).html(html);
	    });
	});
    },

    ////////////////////////////////////////////////////////////////
    //// 
    ////////////////////////////////////////////////////////////////
    duplicates : function() {
	console.group("tk.duplicates");

	var status = false;

	// Warning Duplicate IDs
	jQuery('[id]').each(function(){
	    var ids = jQuery('[id="'+this.id+'"]');
	    
	    if (ids.length>1 && ids[0] == this) {
		console.warn('Multiple ID #' + this.id);
		status = true;
	    }
	});

	if (!status) {
	    console.log("No duplicate id(s)");
	}

	console.groupEnd();
    },

    ////////////////////////////////////////////////////////////////////////
    //// tk.load("#xx","/mtk/render?callback=tk::dummy::1",true);
    ////////////////////////////////////////////////////////////////////////
    load: function (el,url,fade) {
	console.log("tk.load: " + el + " " + url + " fade = " + fade);

	//GOOGLE TRACKER
	tk.tracker("tk.load", el + "," + url);

	jQuery.get(url + "&ajax=1", function(data) {
	    obj = jQuery(el);
	    
	    if (typeof fade == 'undefined') {
		fade = 0;
	    }
	    
	    obj.html(data).hide().fadeIn(fade, function() {
		try {
		    // PUBLISH SOMETHING HERE
		    jQuery.publish("tk.load",[el])
		}
		catch(e) {
		    console.log(e.name + ' > ' + e.message);
		}
	    });

	    return obj;
	});

	return false;
    },

    ////////////////////////////////////////////////////////////////////////
    //// 
    ////////////////////////////////////////////////////////////////////////
    _div_exist : function(id) {
	return jQuery("#" + id).length;
    },

    ////////////////////////////////////////////////////////////////////////
    //// loadScriptSync("test.js")
    ////////////////////////////////////////////////////////////////////////
    loadScriptSync: function(src) {
	var s = document.createElement("script");
	s.src = src;
	s.type = "text/javascript";
	s.async = false;
	document.getElementsByTagName("head")[0].appendChild(s);
    },

    ////////////////////////////////////////////////////////////////////////
    //// 
    ////////////////////////////////////////////////////////////////////////
    loadAsync : function(url, callback) {
	// DON'T USE $.getScript SINCE IT DISABLES CACHING
	jQuery.ajax({
	    'url': url,
	    'dataType': 'script',
	    'cache': true,
	    'success': callback || jQuery.noop
	});
    },

    ////////////////////////////////////////////////////////////////////////
    //// 
    ////////////////////////////////////////////////////////////////////////
    dumpCookies: function(appname) {
	console.group("dumpCookies");

	var cookies = document.cookie.split(";");
	
	for (var i=0; i < cookies.length; i++) {
	    var equals = cookies[i].indexOf("=");

	    // DONT REMOVE THE SESSION COOKIE
	    if (name != appname) {
		var name = equals > -1 ? cookies[i].substr(0, equals) : cookies[i];
		document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
		console.log("removed: " + name);
	    }
	}

	console.groupEnd();
    },

    ////////////////////////////////////////////////////////////////////////
    //// SAMPLE CODE: /RedOlive/mtk/dev/tk/samples/tests/tk.buffer.tcl
    ////////////////////////////////////////////////////////////////////////
    buffer: function () {
	console.log("tk.buffer");

	jQuery(document).ready(function() {
	    jQuery(".tk-link").each(function(e) {
		// SO IT WON'T GET LOADED AGAIN AND AGAIN
		$(this).removeClass("tk-link");

		jQuery(this).click(function(e) {
		    // GET RID OF CLICK FUNTION ON THE LINK
		    e.preventDefault();

		    var obj   = jQuery(this);
		    var tgt   = obj.attr("tk-target");
		    var url   = obj.attr("tk-url");
		    var src   = obj.attr("tk-src");
		    var cache = obj.attr("tk-cache");
		    
		    //src = tk.hashCode(url)

		    //GOOGLE TRACKER
		    tk.tracker("tk.buffer", tgt + "," + url);

		    console.log("#" + tgt + " > div");

		    jQuery("#" + tgt + " > div").addClass("tk-div");
		    
		    // HIDE ALL DIVS IN THE TGT
		    jQuery("#" + tgt + " > .tk-div").fadeOut(0).hide();
		    
		    // IF cache = 0 REMOVE CURRENT SRC
		    if (cache == 0) {
			jQuery("#" + src).remove();
		    }

		    // SO WE DON'T RUN THIS CODE AGAIN
		    obj.removeClass("tk-link");
		    
 		    console.log("TGT: " + tgt + ", SRC: " + src + ", cache:" + cache + ", URL: " + url);

		    if (tk._div_exist(src) == 0) {
			// FIND BACKWARD PARENT OF THIS TARGET
			var prev = $("#" + tgt).parents(".tk-div").attr("id");
			if (!prev) prev = "";

			// SAVE IT INTO BUFFERS
			tk.buffers.push({src:src,tgt:prev});

			// CREATE A DIV
			jQuery("#" + tgt)
			    .append("<div class=tk-div style=display:block id='"
				    + src + "'><div style=padding:10px><img tgt=/tk/img/common/loading.2.gif></div></div>");
			tk.load("#" + src, url, 0);

			try {
			    // PUBLISH SOMETHING HERE
			    jQuery.publish("tk.buffer",['new',src])
			}
			catch(e) {
			    console.log(e.name + ' > ' + e.message);
			}
		    } else if (cache == "1") {
			// SHOW EXISTING DIV
			jQuery("#" + src).fadeIn(0);

			try {
			    // PUBLISH SOMETHING HERE
			    jQuery.publish("tk.buffer",['old',src])
			}
			catch(e) {
			    console.log(e.name + ' > ' + e.message);
			}
		    }
		    
		    return false;
		});
	    });
	});
    },

    ////////////////////////////////////////////////////////////////////////
    //// SAMPLE CODE: /RedOlive/mtk/dev/tk/samples/tests/tk.buffer.tcl
    ////////////////////////////////////////////////////////////////////////
    bufferShow: function (par) {
	console.group("tk.bufferShow: " + par);
	
	for (var i = 0; i < tk.buffers.length; i++) {
	    var item = tk.buffers[i];
	    
	    if (par == item.tgt) {
		console.log("\t>>>>>>>>>>: " + par + " | " + JSON.stringify(item));
	    } else {
		//tk.bufferShow(item.src);
	    }
	}

	console.groupEnd();
    },
    
    ////////////////////////////////////////////////////////////////////////////////
    //// RETURNS (NAME, VALUE) PAIRS FROM ANY OBJECT
    ////////////////////////////////////////////////////////////////////////////////
    obj2str: function(obj, delp, delo, ind){
	delp = delp != null ? delp : " ";   // property delimeter
	delo = delo != null ? delo : "\n";  // object delimeter
	ind  = ind  != null ? ind : " ";     // indent; ind+ind geometric addition not great for deep objects
	var str='';
	
	for(var prop in obj){
	    if(typeof obj[prop] == 'string' || typeof obj[prop] == 'number'){
		var q = typeof obj[prop] == 'string' ? "" : ""; // make this "'" to quote strings
		str += ind + prop + ': ' + q + obj[prop] + q + '; ' + delp;
	    }else{
		str += ind + prop + ': {'+ delp + print(obj[prop],delp,delo,ind+ind) + ind + '}' + delo;
	    }
	}
	
	return str;
    },

    ////////////////////////////////////////////////////////////////////////////////
    //// RETURNS AN OBJECT FROM STRING
    ////////////////////////////////////////////////////////////////////////////////
    str2obj: function(str) {
	eval('var obj='+str);

	return obj;
    },

    ////////////////////////////////////////////////////////////////////////////////
    //// 
    ////////////////////////////////////////////////////////////////////////////////
    include: function(fname) {
	console.log("tk.include: " + fname);

	filetype = fname.split('.').pop();

	//GOOGLE TRACKER
	tk.tracker("tk.include", fname);

	if (filetype=="js"){
	    fileref = document.createElement('script');
	    fileref.setAttribute("type","text/javascript");
	    fileref.setAttribute("src", fname);
	} else if (filetype=="css") {
	    fileref = document.createElement("link");
	    fileref.setAttribute("rel", "stylesheet");
	    fileref.setAttribute("type", "text/css");
	    fileref.setAttribute("href", fname);
	} else if (filetype=="html") {
	    console.log("not quite working ! async issue...");
	    
	    var html = jQuery.get(fname, function() {
		console.log(html.responseText);
	    });
	}

	document.getElementsByTagName("head")[0].appendChild(fileref);
    },

    ////////////////////////////////////////////////////////////////////////////////
    //// tk.blink("#ah1",3);
    ////////////////////////////////////////////////////////////////////////////////
    blink: function(ele,times) {
	console.log("tk.blink: " + ele + ", " + times);

	for (i = 0; i < times; i++) {
	    jQuery(ele).fadeTo('slow', 0.2).fadeTo('slow', 1.0);
	}	
    },

    /////////////////////////////////////////////////////////////////////////////
    ////
    /////////////////////////////////////////////////////////////////////////////
    _setDOM : function(obj,dat) {
	console.group("tk._setDOM");

	dnm = obj.attr("dom-data");
	tag = obj.prop('tagName');
	rad = obj.is(":radio");
	chk = obj.is(":checkbox");

	console.log (obj.prop('tagName') + " " + dnm + " = " + dat);

	if (tag === "INPUT") {
	    if (rad || chk) {
		if (rad) {
		    var name = obj.attr("name");

		    // PARAN IN NAMES
		    name = name.replace("(","\\(");
		    name = name.replace(")","\\)");

		    // PROCESS RADIO BUTTON (SPECIAL)
		    jQuery("[name=" + name + "]").each(function() {
			if (jQuery(this).val() == dat) {
			    jQuery(this).attr('checked', true)
			} else {
			    jQuery(this).attr('checked', false)
			}
		    });
		} else {
		    // PROCESS CHECKBOX 
		    if (obj.val() == dat) {
			obj.attr('checked', true);
		    }
		}
	    } else {
		obj.val(dat);
	    }
	} else if (tag === "SELECT") {
	    obj.val(dat);
	} else {
	    obj.html(dat);
	}

	console.groupEnd();
	return true;
    },

    /////////////////////////////////////////////////////////////////////////////
    ////
    /////////////////////////////////////////////////////////////////////////////
    updateDOM : function() {
	console.group("tk.updateDOM");

	// USING DOM-DATA ATTRIBUTE
	jQuery("[dom-data]").each(function() {
	    obj = jQuery(this);
	    dnm = obj.attr("dom-data");

	    // SKIP NULL VALUES FOR dom-data
	    var val = $.cookie(dnm);
	    if (val != null) {
		console.log(dnm + " = " + val);
		
		tk._setDOM(obj,val);
		console.groupEnd();
	    }
	});

	// USING TK-DATA ATTRIBUTE
	jQuery("[tk-data]").each(function() {
	    obj = jQuery(this);
	    val = obj.attr("tk-data");

	    // SKIP NULL VALUES FOR dom-data
	    if (val != null) {
		console.log(val);
		
		tk._setDOM(obj,val);
		console.groupEnd();
	    }
	});

	console.groupEnd();
	return true;
    },

    /////////////////////////////////////////////////////////////////////////////////////
    //// put [url "Block All" "#" onclick="tk.block(500,'[URL callback tk::dummy::3]',5000)"]
    /////////////////////////////////////////////////////////////////////////////////////
    block: function(wid, url, timer, top) {
	console.group("tk.block: " + wid + ", " + url + ", " + timer + ", " + top);

	//GOOGLE TRACKER
	tk.tracker("tk.block", wid + "," + url);

	if ($(".tk-blocker").length == 0) {
	    console.log("creating tk-blocker div");
	    $("body").append("<div style='display:none;text-align:left' class='tk-blocker'></div>");
	} else {
	    console.log("tk-blocker div already exist");
	}

	$(".tk-blocker").load(url + "&ajax=1");
	
	$.blockUI({message:jQuery(".tk-blocker"), css:{width:wid, cursor: null}, overlayCSS: {cursor: 'not-allowed'}, timeout:timer});
	
	// HIDE IT
	$('.blockUI.blockMsg').hide();

	setTimeout(function(){
	    $('.blockUI.blockMsg').css("z-index","999999");

	    // SHOW IT AFTER CENTERING
	    $('.blockUI.blockMsg').center().show();

	    // if (typeof top != 'undefined') {
	    // 	$('.blockUI.blockMsg').css("top", top + "px");
	    // }
	}, 300);
	
	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////////////
    //// put [url "BLOCK2 FOREVER" "#" onclick="tk.block2('[URL callback tk::dummy::3]', '600px')"]
    /////////////////////////////////////////////////////////////////////////////////////
    block2: function(url, width) {
	console.group("tk.block2: " + url);

	if (width == null) {
	    width = "700px";
	}

	//GOOGLE TRACKER
	tk.tracker("tk.block" + url);

	if ($(".tk-modal").length == 0) {
	    $("body").append(
		"<div class='modal tk-modal' tabindex='-1' role='dialog' style='display:none' data-backdrop='static'>" 
		    + "<div class='modal-dialog>"
		    + "<div class='modal-dialog'>"
		    + "<div class='modal-content' style=width:" + width + ">"
		    + "<div class='modal-body'></div></div></div></div></div>"
	    );
	}

	jQuery(".tk-modal .modal-body").load(url, function() {
	    jQuery(".tk-modal").show();

	    w = jQuery(".tk-modal .modal-dialog").width();

	    jQuery(".tk-modal")
		.css("margin-top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px")
		.css("margin-left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px")
	});

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////////////
    //// <melifyit>
    /////////////////////////////////////////////////////////////////////////////////////
    cloudify: function() {
	console.group("tk.component");

	jQuery("mtk-component").each(function() {
	    var obj  = jQuery(this);
	    var par  = obj.parent();
	    var code = obj.html();

	    jQuery(par).load(tk.siteurl + "?ajax=1&isolate=1&callback=tk::melifyit&code=" + encodeURI(code));

	    console.groupEnd();
	});
    },

    /////////////////////////////////////////////////////////////////////////////////////
    //// GOOGLE ANALYTICS
    /////////////////////////////////////////////////////////////////////////////////////
    tracker: function(id,cond) {
	console.group("tk.tracker: " + id);
	
	if (cond == undefined) {
	    cond = "init"
	}

	//_gaq.push(['_trackEvent', 'Component', id, cond]);
	
	console.groupEnd();
    },

    //////////////////////////////////////////////////////////////////////////////////
    //// CENTER BLOCKUI DIALOG
    //////////////////////////////////////////////////////////////////////////////////
    center : function (handle, parent) {
	console.group("tk.center: handle=" + handle + ", parent= " + parent);
	
	ele = $(handle);

	if (parent == null) {
	    parent = window;
	}

	var height = ele.height();
	var width  = ele.width();

	if (parent == window) {
	    t = ($(parent).height() / 2) - (height / 2);
	    l = ($(parent).width()  / 2) - (width  / 2);
	} else {
	    t = ($(parent).height() / 2) - (height / 2) - $(parent).position().top;
	    l = ($(parent).width()  / 2) - (width  / 2) + $(parent).position().left;
	}
	
	console.warn("top:" + t + ", left:" + l);

	ele.css('top',  t);
	ele.css('left', l);

	console.groupEnd();
	return ele;
    },

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2014-09-25 10:39:52 (a527951)>
    /////////////////////////////////////////////////////////////////////////////
    _ctracker_: function() {
	console.group("_ctracker_");

	var time = Math.round(+new Date()/1000);
	var components = "";

	jQuery(".tk-component").each(function() {
	    var obj = $(this);
	    var id = obj.attr("id");
	    var cl = obj.attr("class");

	    components += (id + "," + cl + "," + location + "," + time + ",");
	});
	
	console.error(jQuery(".tk-component").length + " : " + components);

	jQuery(".tk-dummy").load(tk.siteurl + "?ajax=1&callback=_ctracker_&values=" + escape(components));

	console.groupEnd("test.init");
    },

    ////////////////////////////////////////////////////////////////////////
    //// SET THE CSS3 BLUR TO AN ELEMENT
    ////////////////////////////////////////////////////////////////////////
    blur: function(element, size) {
	var filterVal = 'blur('+size+'px)';

	$(element)
            .css('filter',filterVal)
            .css('webkitFilter',filterVal)
            .css('mozFilter',filterVal)
            .css('oFilter',filterVal)
            .css('msFilter',filterVal);
    },

    ////////////////////////////////////////////////////////////////////////
    //// CONVERT REGULAR LINKS TO BUFFERED LINKS
    ////////////////////////////////////////////////////////////////////////
    link2buffer: function(options) {
	console.group("app.link2buffer: " + tk.obj2str(options));
	
	jQuery("#" + options.container + " a").each(function() {
	    var obj  = $(this)
	    var pg   = $(this).attr("id");
	    var href = $(this).attr("href");

	    // SKIP EMPTY HREF AND PAGE IDS
	    if (href != "" && pg != undefined) {
		console.log(pg + ", " + href);
		
		obj
		    .addClass("tk-link")
		    .attr("tk-url", href)
		    .attr("tk-src", pg + "-link-container")
		    .attr("tk-target", options.target)
		    .attr("tk-cache", options.cache)
		    .attr("href", "#");
	    }
	});
	
	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    buffer2:  function(src,tgt,url,cache) {
	console.group("app.buffer: " + src + ", " + tgt + ", " + url + ", " + cache);
	
	// HIDE ALL TGT CHILDREN
	$("#" + tgt + " > div").hide(0);

	if ($("#" + src).length == 0) {
	    console.log("src does not exist. create it");
	    
	    $("#" + tgt).append($("<div class=tk-buffered id=" + src + ">").load(url));
	} else {
	    console.log("src exist. show it");
	    
	    $("#" + tgt + " #" + src).show(0);
	}

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    getURL:  function(options) {
	console.group("app.getURL");

	if (typeof options.type  === "undefined") {options.type  = "GET";}
	if (typeof options.async === "undefined") {options.async = false;}
	if (typeof options.cache === "undefined") {options.cache = false;}

	console.log("OPTIONS:", JSON.stringify(options));

	var rval =  $.ajax({
            type: options.type,
            url: options.url,
	    data: options.data,
            cache: options.cache,
            async: options.async
	}).responseText;

	console.groupEnd();
	return rval;
    }
};

/////////////////////////////////////////////////////////////////////////////////////
//// INITIALZE TK
/////////////////////////////////////////////////////////////////////////////////////
jQuery(document).ready(function() {
    tk.init();

    if (0) {
	window.onerror = function (msg, url, line) {
    	    alert(msg + ", " + url + ", " + line);
	}
    }
});

//////////////////////////////////////////////////////////////////////////////////////
//// 
//////////////////////////////////////////////////////////////////////////////////////
jQuery.fn.center = function () {
    t = Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop());
    l = Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft());

    if (t < 100) {t = 100;}

    this.css("position","absolute");
    this.css("top",  t);
    this.css("left", l);

    return this;
}

/////////////////////////////////////////////////////////////////////////////////
//// DOES NAMESPACE EXIST ?
/////////////////////////////////////////////////////////////////////////////////
namespace = function(name,f) {
    if(typeof name != "string") throw( 'TYPE_ERROR:"string required"');

    var i, a = name.split("."), c = this, s = [], b, r;
    f = f || 0;
    
    for( i in a ) {
	c ? a[i] in c ? ( c = c[ a[i] ], s.push( a[i] ), b = !0 ) : b = !1 : 0;
    }
    r = [ b, c, s, a, name ];
    return f < 0 ? r : r[+f||f]; 
}

/////////////////////////////////////////////////////////////////////////////////
//// RETURN BOOTSTRAP ENV
/////////////////////////////////////////////////////////////////////////////////
function bootstrapEnv() {
    var envs = ['xs', 'sm', 'md', 'lg'];

    var $el = $('<div>');
    $el.appendTo($('body'));

    for (var i = envs.length - 1; i >= 0; i--) {
        var env = envs[i];

        $el.addClass('hidden-'+env);
        if ($el.is(':hidden')) {
            $el.remove();
            return env;
        }
    }
}

