angular.module 'usability'

.controller 'MainCtrl', ( $rootScope, $scope, $timeout, $mdSidenav, $log ) ->

    $scope.languageChooserIsVisible = true
    $rootScope.$on 'languageChooserIsVisible', ( event, isVisible ) ->
        $scope.languageChooserIsVisible = isVisible

    $scope.toggleLeft = ->

        $mdSidenav('left').toggle()


.controller 'LeftCtrl', ( $scope, $timeout, $mdSidenav, $log ) ->

    $scope.close = ->

        $mdSidenav('left').close()

