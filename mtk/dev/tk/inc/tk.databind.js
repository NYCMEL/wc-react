/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-21 15:46:42 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var tk = tk || {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.databind = function(ele, binder) {
    console.group("tk.databind:", ele);

    // BIND VARIABLE TO HANDLER
    $("#" + ele + " [data-key]").each(function() {
	console.group("BIND VARIABLE TO HANDLER")
	
	// CUSTOM BINDING
	tk._bind($(this).attr("id"), binder);

	console.groupEnd();
    });

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk._bind = function(options) {
    console.group("tk._bind");
    
    console.groupEnd();
};

