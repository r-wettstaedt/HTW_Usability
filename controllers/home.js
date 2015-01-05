window.App.controller('HomeCtrl', ['$scope', '$rootScope', function($scope, $rootScope) {
  
  $scope.navElements = ['Sprachreisen', 'Eventkalender', 'Standorte', 'Einstufungstest', 'Zertifikate', 'FAQ']

  $rootScope.$watch('route', function(newValue){
    $scope.route = newValue
  })

  $scope.routing = function( route ) {
    $rootScope.route = route.toLowerCase()
  }

}])