///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
melified.directive("highlight", function () {
    return function (scope, element, attrs) {
	if (scope.day == attrs["highlight"]) {
	    element.css("color", "indianred");
	} else {
	    element.css("color", "green");
	}
    }
});
