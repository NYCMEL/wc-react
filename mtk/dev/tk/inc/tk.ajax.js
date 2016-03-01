/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-03-01 12:09:41 (melify)>
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

    var req = $.ajax({
	url: options.url,
	async: false,
	type: options.type,
	data: options.data,
	contentType: options.contentType,
	dataType: options.dataType
    });
    
    console.groupEnd();
    return req;
};

/////////////////////////////////////////////////////////////////////////////
//// FOR TESTING PURPOSES
/////////////////////////////////////////////////////////////////////////////
tk.ajax.test = function() {
    console.group("tk.ajax.test");
    
    var request = tk.ajax.init({
	url: "http://localhost:8080/dbGet/users/1000",
	type: "POST",
	data: "TESTING",
	dataType: "json",
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
