/////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2017-01-24 11:32:58 (melify)>
/////////////////////////////////////////////////////////////////////////////
var tkForm = {};

/////////////////////////////////////////////////////////////////////////////
//// KEEP SUBMIT BUTTON DISABLED UNTIL ALL REQUIRED FIELS HAVE VALUES
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
            if ($(this).val() === "") {
		$form.data('empty', 'true');
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

// tkForm.submitState('#<form-id>');
