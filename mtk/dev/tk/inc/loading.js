/////////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
$(document).on({
    ajaxStart: function() {
	//console.log("AJAXSTART");
	
	$("body").addClass("loading");
    },
    ajaxStop:  function() { 
	//console.log("AJAXSTOP");
	
	$("body").removeClass("loading");
    }
});
