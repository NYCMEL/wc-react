/////////////////////////////////////////////////////////////////////////////////////
//// /Melify/mtk/dev/tk/src/utl/tk.load.tcl
/////////////////////////////////////////////////////////////////////////////////////

var tkLoad = {
    init: function(options) {
	console.group("tkLoad.init");
	
	var obj = jQuery.parseJSON(options.json);

	var component = obj.component;
	var cparent   = obj.parent;
	var params    = obj.parameters;

	var rval = component + " ";
	for (var key in params) {
	    rval += "-" + key + " " + params[key] + " ";
	} 

	tk.load("#" + cparent, tk.siteurl + "?callback=tk::load::init&component=" + encodeURIComponent(rval));

	console.groupEnd();
    }
}
