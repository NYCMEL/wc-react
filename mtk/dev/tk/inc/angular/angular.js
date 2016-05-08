/////////////////////////////////////////////////////////////////////////////
//// create tk namespace for angular
/////////////////////////////////////////////////////////////////////////////
tk = tk || {};
tk.angular = tk.angular || {};

///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
var melified = angular.module('melified', ['ngRoute', "ngSanitize", "ngAnimate"]);

///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
melified.controller('MelifiedCtrl', function($scope, $http, $compile) {
    console.group('MelifiedCtrl');

    $scope.app = {};

    ///////////////////////////////////////////////////////////////////////
    /////
    ///////////////////////////////////////////////////////////////////////
    $scope.compile = function(id) {
	console.group('melified.compile: ' + id);

	var el = angular.element(
	    "<div id=" + id + " ng-show=\"page == '" + id + "'\"></div>"
	);

        $compile(el)($scope); //USE ANGULAR INSIDE el
    },

    ///////////////////////////////////////////////////////////////////////
    /////
    ///////////////////////////////////////////////////////////////////////
    $scope.load= function(id, url, static) {
	console.group('melified.load: ' + id + ", " + url + ", " + static);
	
	// IF ELEMENT DOES NOT EXIST CREATE AND LOAD CONTENT
	if ($("#" + id).length == 0) {
	    var el = angular.element(
		"<div id=" + id + " ng-show=\"page == '" + id + "'\"></div>"
	    );
            $compile(el)($scope); //USE ANGULAR INSIDE el
	    $(".template-guts").append(el);

	    $scope.get(url, id);
	}

	// IF NOT STATIC LOAD PAGE EVERY VISIT
	if (!static) {
	    $scope.get(url, id);
	}

	console.log("Changing page to: " + id);

	// THIS SHOW PAGE AS CURRENT
	$scope.page  = id;

	console.groupEnd();
    };

    ///////////////////////////////////////////////////////////////////////
    /////
    ///////////////////////////////////////////////////////////////////////
    $scope.get = function(url, id) {
	console.log("melified.get: " + id + ", " + url);

	$http.get(url).
	    success(function(data, status, headers, config) {
		var html = $compile(data)($scope);
		
		jQuery("#" + id).html(html);
	    }).
	    error(function(data, status, headers, config) {
		alert(status);
	    });
    }

    console.groupEnd();
});

///////////////////////////////////////////////////////////////////////////
///// 
///////////////////////////////////////////////////////////////////////////
tk.angular.app = function(variable, value) {
    console.group("tk.angular.app: ", variable, value);

    var scope = $("body").scope();

    if (variable == undefined) {
	console.groupEnd();
	return scope.app;
    }

    if (variable == undefined) {
	console.groupEnd();
	return scope.app[variable]
    }
    
    scope.$apply(function() {
	scope.app[variable] = value;
    });

    console.groupEnd();
    return scope.app;
}

///////////////////////////////////////////////////////////////////////////
///// 
///////////////////////////////////////////////////////////////////////////
tk.angular.compile = function(el) {
    console.group("tk.angular.compile: ", el);

    var el = (typeof el == 'string') ? el : null ;  
    // The new element to be added
    if (el != null ) {
        var $div = $( el );

        // The parent of the new element
        var $target = $("[ng-app]");

        angular.element($target).injector().invoke(['$compile', function ($compile) {
            var $scope = angular.element($target).scope();
            $compile($div)($scope);
            // Finally, refresh the watch expressions in the new element
            $scope.$apply();
        }]);
    }

    console.groupEnd();
}

