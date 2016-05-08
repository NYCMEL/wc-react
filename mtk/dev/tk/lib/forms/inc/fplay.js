/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-05-08 10:08:06 (melify)>
/////////////////////////////////////////////////////////////////////////////
var fplay = {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////
fplay.init = function(options) {
    console.group("fplay.init");

    // MAKE TEXT AREA PRETTY
    editor = CodeMirror.fromTextArea(document.getElementById("json"), {
        lineNumbers: true,
        matchBrackets: true,
        continueComments: "Enter",
        extraKeys: {"Ctrl-Q": "toggleComment"},
	styleActiveLine: true,
	mode : "javascript",
	htmlMode: true,
	lineSeparator:null
    });

    $(".btn-update").on("click", function() {
	try {
	    //$(".play-dummy").load(tk.siteurl + "?ajax=1&callback=play::save&text=" + escape(text));

	    jQuery.parseJSON(editor.getValue());
	    
	    var text = editor.getValue();
	    var url  = tk.siteurl + "?ajax=1&callback=play::save";

	    $.ajax({
		type: "POST",
		url: tk.siteurl + "?ajax=1&callback=fplay::update",
		data: text,
		success: function() {
		    alert("A");
		},
		error: function() {
		    alert("B");
		}
	    });
	}
	catch(e) {
	    $("#customize-dummy-content").load(tk.siteurl + "?ajax=1&callback=customize::error")
	    $("#customize-dummy").show(0);
	}


    });

    if (0) {
	var scope = $("body").scope();

	scope.app = {
	    fname:"Mel",
	    lname:"Heravi",
	    address:"400 East 41st Street",
	    city: "New York",
	    state: "NY",
	    zipcode: "10012",
	    email: "mel@gmail.com",
	    ssn: "555-55-5555"
	}

	scope.$apply();
    }

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////
fplay.reset = function(options) {
    console.group("fplay.reset");

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////
fplay.update = function(options) {
    console.group("fplay.update");

    console.groupEnd();
};
