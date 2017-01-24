/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-01-24 08:24:10 (melify)>
/////////////////////////////////////////////////////////////////////////////
var tkForm = {};

/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tkForm.init = function(id) {
    console.group("tkForm.init:", id);

    let obj = $(this);

    obj.submit(function(e){ 
	console.log(">>>>>>>>>>>>>>>>>>");

	e.preventDefault();

	alert(id);

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

