////////////////////////////////////////////////////////////////////////////////
//// KEEP SUBMIT BUTTON DISABLED UNTIL ALL REQUIRED FIELS HAVE VALUES
////////////////////////////////////////////////////////////////////////////////
function submitState(el) {
    console.group("submitState", el);
    
    var $form = $(el),
        $requiredInputs = $form.find('input:required'),
        $submit = $form.find('input[type="submit"]');

    $submit.attr('disabled', 'disabled');

    $("input").bind("change paste keyup", function() {
	$form.data('empty', 'false');

	$requiredInputs.each(function() {
            if ($(this).val() === '') {
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

// submitState('#<form-id>');
