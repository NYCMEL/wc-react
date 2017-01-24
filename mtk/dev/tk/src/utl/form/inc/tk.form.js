/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-01-24 08:25:44 (melify)>
/////////////////////////////////////////////////////////////////////////////
var tkForm = {};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tkForm.init = function(id) {
    console.group("tkForm.init:", id);

    let obj = $("#" + id);

    obj.submit(function(e){ 
	e.preventDefault();

	$.ajax({
	    data: obj.serialize(),
	    type: obj.attr("method"),
	    url: obj.attr("action"),
	    success: function(response) {
		console.info("form post success...");
		$("#form-result-" + id).html(response).show();
	    },
	    error: function(XMLHttpRequest, textStatus, errorThrown) {
		$("#form-result-" + id).html(textStatus + ", " + errorThrown + ", " + XMLHttpRequest.status).show();
	    }
	});
    });

    console.groupEnd();
};

