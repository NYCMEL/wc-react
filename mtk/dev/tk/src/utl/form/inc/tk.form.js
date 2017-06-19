/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-06-19 09:17:12 (melify)>
/////////////////////////////////////////////////////////////////////////////
var tkForm = {};

/////////////////////////////////////////////////////////////////////////////
//// KEEP SUBMIT BUTTON DISABLED UNTIL ALL REQUIRED FIELS HAVE VALUES
////
//// usage: tkForm.submitState('#<form-id>');
/////////////////////////////////////////////////////////////////////////////
tkForm.submitState = function(el) {
    console.group("tkForm.submitState:", el);

    var $form = $(el),
        $requiredInputs = $form.find('input:required'),
        $submit = $form.find('input[type="submit"]');

    $submit.attr('disabled', 'disabled');

    $("input").bind("change paste keyup", function() {
	$form.data('empty', 'false');

	$requiredInputs.each(function() {
	    console.log(">>>>", $(this).attr("type"), $(this));
	    
	    switch($(this).attr("type")) 
	    {
		case "radio":
		// NEED TO CHECK IF ANY RADIO BUTTON IN THIS GROUP IS CHECKED
		if ($(this).is(":checked")) {
		    $form.data('empty', 'false');
		} else {
		    $form.data('empty', 'true');
		}
		break;

		case "checkbox":
		if ($(this).is(":checked")) {
		    $form.data('empty', 'false');
		} else {
		    $form.data('empty', 'true');
		}
		break;

		default:
		if ($(this).val() === "") {
		    $form.data('empty', 'true');
		}
		break;
	    }
	});

	if ($form.data('empty') === 'true') {
            $submit.attr('disabled', 'disabled').attr('title', 'fill in all required fields');
	} else {
            $submit.removeAttr('disabled').attr('title', 'click to submit');
	}
    });

    console.groupEnd();
}
