/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-21 15:51:28 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var tk = tk || {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.databind = function(ele, bvar, callback) {
    console.group("tk.databind:", ele, bvar);

    // BIND VARIABLE TO HANDLER
    $("#" + ele + " [data-key]").each(function() {
	let id = $(this).attr("id");
	let ky = $(this).attr("data-key");

	console.group("Binding:", id, ky)
	
	var watchable = DataBind.bind($('#' + id), bvar);
	
	watchable.watch(callback);

	console.groupEnd();
    });

    console.groupEnd();
};
