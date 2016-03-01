/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-03-01 12:18:05 (melify)>
/////////////////////////////////////////////////////////////////////////////
tk = tk || {};
tk.ajax = tk.ajax || {};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.ajax.init = function(options) {
    console.group("tk.ajax.init", JSON.stringify(options));
    
    if (!options.contentType) {
	options.contentType = "application/x-www-form-urlencoded";
    }

    if (!options.async) {
	options.async = true;
    }

    var req = $.ajax({
	url: options.url,
	async: options.async,
	type: options.type,
	data: options.data,
	contentType: options.contentType,
	dataType: options.dataType
    });
    
    console.groupEnd();
    return req;
};

/////////////////////////////////////////////////////////////////////////////
//// FOR TESTING PURPOSES (HOW TO USE IT)
/////////////////////////////////////////////////////////////////////////////
tk.ajax.test = function() {
    console.group("tk.ajax.test");
    
    var request = tk.ajax.init({
	url: "http://localhost:8080/dbGet/users/1000",
	type: "POST",
	data: "TESTING",
	dataType: "json",
	async: false,
    });

    request.success(function(result) {
	//console.log(result);
	console.log(JSON.stringify(result));

	$("body").append(JSON.stringify(result));
    });

    request.fail(function(jqXHR, textStatus) {
	alert("Request failed: " + textStatus);
    });
}
