/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-03-01 12:02:58 (melify)>
/////////////////////////////////////////////////////////////////////////////
tk = tk || {};
tk.ajax = tk.ajax || {};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.ajax.init = function(options) {
    console.group("tk.ajax.init");
    
    var req = $.ajax({
	url: options.url,
	async: false,
	type: options.type,
	data: options.data,
	contentType: "application/x-www-form-urlencoded",
	dataType: options.dataType
    });
    
    console.groupEnd();

    return req;
};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.ajax.test = function() {
    console.group("tk.ajax.test");
    
    var request = $.ajax({
	url: "http://localhost:8080/dbGet/users/1000",
	async: false,
	type: "POST",
	data: "HELLO",
	contentType: "application/x-www-form-urlencoded",
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
