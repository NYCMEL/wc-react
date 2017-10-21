/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-21 15:59:37 (melify)>
////   Example: test::databind (tk-samples)
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

	console.group("binding:", id, ky)
	
	var watchable = DataBind.bind($('#' + id), bvar);
	
	watchable.watch(callback);

	console.groupEnd();
    });

    console.groupEnd();
};

// // EXAMPLE
// mybinder = function(ev) {
//     console.group("mybinder:", this.id, ev.type, ev.data.newValue);
    
//     let type = $("#" + this.id).prop("nodeName");
    
//     switch(type) 
//     {
// 	case "SELECT":
// 	console.log("Do something for:", type);
// 	break;
//     }
    
//     console.groupEnd();
// }

// // INITIALIZE FORM
// tk.form		= tk.form || {};
// tk.form.key_name	= "Mel";
// tk.form.key_select	= 2;
// tk.form.key_checkbox	= true;
// tk.form.key_radio	= true;
// tk.form.key_h1		= "Heravi";

// tk.databind("id-test", tk.form, mybinder);
