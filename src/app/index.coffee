angular.module "usability", ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngResource', 'ngRoute', 'ngMaterial']

.config ( $routeProvider ) ->

    $routeProvider.otherwise
        redirectTo: '/'

    $routeProvider.when '/',
        templateUrl    : 'app/main/main.html'
        controller     : 'MainCtrl'


