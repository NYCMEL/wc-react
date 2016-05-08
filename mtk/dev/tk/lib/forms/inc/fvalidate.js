function validate(id, next) {
    var valid = true;

    $.each($("#" + id + " input[required]"), function (index, value) {
	if(!$(value).val()){
            valid = false;
	}
    });

    if (valid) {
	$("#" + id).slideToggle(500, function() {
	    $("#" + id).slideToggle(500);
	});
    }
}

// if(valid) {
//     $(submitButton).attr("disabled", false);
// } else {
//     $(submitButton).attr("disabled", true);
// }
