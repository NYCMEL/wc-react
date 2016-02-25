/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2015-11-07 16:50:32 (melify)>
/////////////////////////////////////////////////////////////////////////////////
var tkPing = {
    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    init: function(url) {
	console.group("tkPing.init");

	jQuery.ajax({
	    url: url,
	    type: "HEAD",
	    timeout:5000,
	    dataType: "jsonp",
	    data: "",
	    
	    complete: function(xhr) {
		//console.log("complete: " + xhr.status);
	    },

	    error: function(xhr){
		//console.log("EEEEEEEEEEEEEEEEEE: " + xhr.status);
	    },

	    statusCode: {
		200: function (response) {
		    console.log("SUCCESS: " + url);
		    jQuery.publish("tkPinged", ["host", url, "status", "SUCCESS"]);
		},
		400: function (response) {
		    console.log("FAILED: " + url);
		    jQuery.publish("tkPinged", ["host", url, "status", "FAILED"]);
		},
		404: function (response) {
		    console.log("FAILED: " + url);
		    jQuery.publish("tkPinged", ["host", url, "status", "FAILED"]);
		},
		0: function (response) {
		    console.log("FAILED: " + url);
		    jQuery.publish("tkPinged", ["host", url, "status", "FAILED"]);
		}              
	    }
	});

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    test: function() {
	console.group("tkPing.test");

	jQuery.subscribe('tkPinged', tkPing.testCB);
	
	tkPing.init("http://www.melify.com");
	tkPing.init("http://www.yahoo.com");
	tkPing.init("http://www.google.com");
	tkPing.init("http://mel.melify.com");
	tkPing.init("http://www.THIS-SHOULD-FAIL.com");
	tkPing.init("nykpwm408703:1090/mtk/render");

	console.groupEnd();
    },

    /////////////////////////////////////////////////////////////////////////////
    //// 
    /////////////////////////////////////////////////////////////////////////////
    testCB: function(event, host, host, status, status) {
	console.group("tkPing.test");

	console.log('JUNK CALLBACK: HOST=' +  host + " STATUS=" + status);

	if ($("#table-pinged tbody").length != 0) {
	    if (status == "SUCCESS") {
		var tmp = "<i class='fa fa-check' style=color:green></i>"
		var url = "<a href=" + host + " target=_blank>" + host +"</a>";
		var cls = "alert-success" 
	    } else {
		var tmp = "<i class='fa fa-times' style=color:red></i>";
		var url = "<a href=" + host + " target=_blank style=color:red>" + host +"</a>";
		var cls = "alert-danger" 
	    }

	    var row = "<tr class=" + cls + "><td>" + url + "</td><td align=center>" + tmp + "</td></tr>";

	    $("#table-pinged tbody").append(row);
	}
	
	console.groupEnd();
    }
}
