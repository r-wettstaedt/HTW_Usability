window.App.controller('LandingCtrl', ['$scope', '$rootScope', function($scope, $rootScope){

  $scope.countries = ['china', 'france', 'germany', 'portugal', 'spain', 'uk']

  $rootScope.$watch('route', function(newValue){
    $scope.route = newValue
  })

  $scope.routing = function() {
    $rootScope.route = 'home'
  }

}])