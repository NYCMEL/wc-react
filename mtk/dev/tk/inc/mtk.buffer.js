/////////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////////
var mtk = {
    buffer : {
	cached:  [],

	/////////////////////////////////////////////////////////////////////////////
	//// 
	/////////////////////////////////////////////////////////////////////////////
	init: function(src, tgt, url, cache) {
	    console.group("mtk.buffer.init: " + src + ", " + tgt + ", " + url + ", " + cache);
	    
	    //GOOGLE TRACKER
	    tk.tracker("mtk.buffer", src + ", " + tgt + ", " + url);

	    // HIDE ALL TGT CHILDREN
	    $("#" + tgt + " > div").hide(0);

	    // IF cache = 0 REMOVE CURRENT SRC
	    if (cache == 0) {
		$("#" + src).remove();
	    }

	    if ($("#" + src).length == 0) {
		// CREATE ONE
		console.log("src does not exist. create it");
		
		if (url) {
		    $("#" + tgt).append($("<div class=tk-buffered id=" + src + ">").load(url));
		} else {
		    $("#" + tgt).append($("<div class=tk-buffered id=" + src + ">"));
		}

		// FIND BACKWARD PARENT OF THIS TARGET
		var prev = $("#" + tgt).parents(".tk-buffered").attr("id"); if (!prev) prev = "";

		mtk.buffer.cached.push({src:src,tgt:prev});
		
		jQuery.publish('mtkBuffer', ['created', src, tgt]); // PUBLISH
		console.log("PUBLISHING: mtkBuffer created " + src + ", " + tgt);
	    } else {
		// SHOW IT
		console.log("src exist. show it");
		
		$("#" + tgt + " #" + src).show(0);

		jQuery.publish('mtkBuffer', ['shown', src, tgt]); // PUBLISH
		console.log("PUBLISHING: mtkBuffer shown " + src + ", " + tgt);
	    }

	    console.groupEnd();
	},

	/////////////////////////////////////////////////////////////////////////////
	//// 
	/////////////////////////////////////////////////////////////////////////////
	console: function(par) {
	    if (!par) par = "";

	    for (var i = 0; i < mtk.buffer.cached.length; i++) {
		var item = mtk.buffer.cached[i];
		
		if (par == item.tgt) {
		    console.group(item.src)

		    mtk.buffer.console(item.src);

		    console.groupEnd()
		}
	    }
	}	
    }
};
