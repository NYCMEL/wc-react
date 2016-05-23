/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-05-23 18:25:11 (melify)>
/////////////////////////////////////////////////////////////////////////////
var tkForm = {};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tkForm.init = function(options) {
    console.group("tkForm.init: ", JSON.stringify(options));

    $("#" + options.id).submit( function(e){ 
	e.preventDefault();

	tkForm.process({id:options.id, method:options.method, url:options.url, cb:options.callback, result:options.result});
    });

    console.groupEnd();
};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tkForm.process = function(options) {
    console.group("tkForm.process: ", JSON.stringify(options));

    alert("callback=" + options.cb + "&ajax=1&" + $("#" + options.id).serialize())

    $.ajax({
	type: options.method,
	url: options.url,
	data: "callback=" + options.cb + "&ajax=1&" + $("#" + options.id).serialize(),
	success: function(data) {   
	    $("#" + options.result).html(data);
	}
    });

    console.groupEnd();
};

