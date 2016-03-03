///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
var melified = angular.module('melified', ['ngRoute', "ngSanitize"]);

///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
melified.controller('MelifiedCtrl', function($scope, $http, $compile) {
    console.group('MelifiedCtrl');

    $scope.msg    = "NO MESSAGE YET !";
    $scope.page   = "home";

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

/////////////////////////////////////////////////////////////////////////////
//// create tk namespace for angular
/////////////////////////////////////////////////////////////////////////////
tk = tk || {};
tk.angular = tk.angular || {};

/////////////////////////////////////////////////////////////////////////
//// 
/////////////////////////////////////////////////////////////////////////////
tk.angular.setScope = function(variable,value) {
    console.group("tk.angular.setScope:", variable, value);

    var appElement = document.querySelector("[ng-app=melified]");
    var $scope = angular.element(appElement).scope();
    
    $scope.$apply(function() {
	$scope[variable] = value;
    });

    console.groupEnd();
    return true;
};

///////////////////////////////////////////////////////////////////////////
///// 
///////////////////////////////////////////////////////////////////////////
tk.angular.getScope = function(variable) {
    console.group("tk.angular.getScope:", variable);

    var appElement = document.querySelector("[ng-app=melified]");
    var $scope = angular.element(appElement).scope();
    
    $scope.$apply(function() {
	console.log($scope[variable]);
    });

    console.groupEnd();
    return true;
}

///////////////////////////////////////////////////////////////////////////
///// 
///////////////////////////////////////////////////////////////////////////
tk.angular.scope = function() {
    console.group("tk.angular.scope");

    var appElement = document.querySelector("[ng-app=melified]");
    var $scope = angular.element(appElement).scope();
    
    console.groupEnd();
    return $scope;
}

