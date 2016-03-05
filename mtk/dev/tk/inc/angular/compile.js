/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2016-03-05 15:10:03 (melify)>
/////////////////////////////////////////////////////////////////////////////////
function compileAngularElement( elSelector) {
    var elSelector = (typeof elSelector == 'string') ? elSelector : null ;  
    // The new element to be added
    if (elSelector != null ) {
        var $div = $( elSelector );

        // The parent of the new element
        var $target = $("[ng-app]");

        angular.element($target).injector().invoke(['$compile', function ($compile) {
            var $scope = angular.element($target).scope();
            $compile($div)($scope);
            // Finally, refresh the watch expressions in the new element
            $scope.$apply();
        }]);
    }
}

// example:
//     compileAngularElement('#burger'); 
