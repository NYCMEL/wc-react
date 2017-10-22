/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-22 08:56:34 (melify)>
////   Example: test::databind (tk-samples)
/////////////////////////////////////////////////////////////////////////////////
var tk = tk || {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.databind = function(bvar, callback=null) {
    console.group("tk.databind:", bvar);

    // BIND VARIABLE TO HANDLER
    $("[data-key]:not(.databind").each(function() {
	let id = $(this).attr("id");

	console.log("binding", id, $(this).attr("data-key"), {dom: true, model: true, children: true});
	
	var watchable = DataBind.bind($('#' + id), bvar);
	
	// MARK IT. DO NOT PROCESS NEXT ROUND
	$("#" + id).addClass("databind");

	// ADD CALLBACK IF ANY
	if (callback) {
	    watchable.watch(callback);
	}
    });

    console.groupEnd();
};
