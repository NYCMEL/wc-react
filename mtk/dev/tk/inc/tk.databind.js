/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-22 09:21:41 (melify)>
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
	let key = $(this).attr("data-key");

	console.log("binding", id, key, {dom: true, model: true, children: true});
	
	var watchable = DataBind.bind($('#' + id), bvar);
	
	// MARK IT. DO NOT PROCESS NEXT ROUND
	$("#" + id).addClass("databind");

	// ADD CALLBACK IF ANY
	if (callback) {
	    watchable.watch(callback);
	}

	// ADD TO COOKIES IF REQUIRED
	// if (cookie) {
	//     $.cookie("databind_" + key, bvar[key]);
	// }
    });

    console.groupEnd();
};
