var tkRest2Dict = {
    destination: null,
    callback: null,
    times: Date.now(),

    /////////////////////////////////////////////////////////////////////////////
    //// Time-stamp: <2016-02-27 09:31:55 (melify)>
    /////////////////////////////////////////////////////////////////////////////
    init: function(options) {
	console.group("tkRest2Dict.init: " + options.url + ", " + options.callback);

	callback = options.callback;
	destination = options.id;

	jQuery.ajax(options.url, {
	    success: tkRest2Dict.success,
	    error:   tkRest2Dict.error
	}).fail(function(jqXHR, textStatus, errorThrown) {
	    console.log(jqXHR.responseText);
	});

	console.groupEnd("tkRest2Dict.init");
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    success: function(data) {
	console.group("tkRest2Dict.success");

	tkRest2Dict.timee = Date.now();
	var timer = (tkRest2Dict.timee - tkRest2Dict.times);

	console.log("IT TOOK: " + timer + " miliseconds");

	console.log(data);

	var jstr = JSON.stringify(data);

	var url = (tk.siteurl + "?callback=" + callback + "&ajax=1&timer=" + timer + "&json=" + encodeURI(jstr));

	console.log(url);

	$(destination).load(url);

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    error: function(jqxhr) {
        console.log("EEEEEEEEEEEEEEEEEEEEEEEE: " + jqxhr.responseText);
    }
}
