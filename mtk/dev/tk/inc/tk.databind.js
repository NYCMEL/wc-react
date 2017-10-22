/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-10-22 08:46:20 (melify)>
////   Example: test::databind (tk-samples)
/////////////////////////////////////////////////////////////////////////////////
var tk = tk || {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.databind = function(ele, bvar, callback=null) {
    console.group("tk.databind:", ele, bvar);

    // BIND VARIABLE TO HANDLER
    $("#" + ele + " [data-key]").each(function() {
	let id = $(this).attr("id");

	console.log("binding", id, $(this).attr("data-key"), {dom: true, model: true, children: true});
	
	var watchable = DataBind.bind($('#' + id), bvar);
	
	if (callback) {
	    watchable.watch(callback);
	}
    });

    console.groupEnd();
};

//// EXAMPLE
// ######################################################
// #### 
// ######################################################
// m::proc -public test::databind {
// } {
//     Documentation goes here...
// } {    
//     Trace
//     variable _id [id]

//     include "/GitHub/databind/src/DataBind.min.js"
//     include "/tk/inc/tk.databind.js"

//     division [style margin 50px width 500px] id="id-test" {
// 	h1 id="id-h1" data-key="key_h1" "Hello Mel"

// 	put {
// 	    <textarea data-key="key_name" id="id-name" rows="5" cols="30" class="form-control"></textarea>
// 	}

// 	br
// 	select s data-key="key_select" id="id-select"  class="form-control" {
// 	    option "Please Select" value=
// 	    foreach i {1 2 3 4 5} {
// 		option $i value=$i
// 	    }
// 	}

// 	br
// 	checkbox cb= id="id-checkbox" data-key="key_checkbox"
// 	space 20 0
// 	radio_button cb= id="id-radio" data-key="key_radio"

// 	# GET A CALLBACK WHEN VALUE CHANGES
// 	javascript {
// 	    put {
// 		jQuery(document).ready(function() {
// 		    // CUSTOM CHANGE HANDLING EXAMPLE
// 		    mybinder = function(ev) {
// 			console.group("mybinder:", this.id, ev.type, ev.data.newValue);
			
// 			let type = $("#" + this.id).prop("nodeName");
			
// 			switch(type) 
// 			{
// 			    case "SELECT":
// 			    console.log("Do something for:", type);
// 			    break;
// 			}
			
// 			console.groupEnd();
// 		    }

// 		    // INITIALIZE FORM
// 		    tk.form		 = tk.form || {};
// 		    tk.form.key_name	 = "Mel";
// 		    tk.form.key_select	 = 2;
// 		    tk.form.key_checkbox = true;
// 		    tk.form.key_radio	 = true;
// 		    tk.form.key_h1	 = "Heravi";

// 		    tk.databind("id-test", tk.form, mybinder);
// 		});
// 	    }
// 	}
//     }
// }
