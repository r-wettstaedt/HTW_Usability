window.App.controller('MainCtrl', ['$scope', '$rootScope', function($scope, $rootScope){
  
  $rootScope.route = '/'

  $rootScope.$watch('route', function(newValue){
    $scope.route = newValue
  })

}])