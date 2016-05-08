/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-05-08 09:57:47 (melify)>
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
	var text = editor.getValue();

	$(".play-dummy").load(tk.siteurl + "?callback=play::save&text=" + escape(text));
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
