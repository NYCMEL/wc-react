///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
melified.factory('ApiFactory', ['$http', function ($http) {
    return {
	getUsers: function () {
	    url = "/mtk/rest?key=query&type=json&query=select%20*%20from%20users%20"

	    var promise = $http.get(url).then(function(response) {
		return response.data;
	    }, function (error) {
		alert("ERROR: " + error);
	    })

	    return promise;
	}
    }
}]);

///////////////////////////////////////////////////////////////////////////
/////
///////////////////////////////////////////////////////////////////////////
melified.controller('UserCtrl', ['$scope', 'ApiFactory', function ($scope, ApiFactory) {
    $scope.Users = null;

    ApiFactory.getUsers().then(function(data) {
	$scope.users = data;
    });
}]);
