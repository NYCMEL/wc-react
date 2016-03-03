///////////////////////////////////////////////////////////////////////////
///// NOT IN USE
///////////////////////////////////////////////////////////////////////////
melified.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
	when('/', {
	    templateUrl: 'templates/add-order.html',
	    controller: 'AddOrderController'
	}).
	otherwise({
	    redirectTo: '/home'
	});
}]);
