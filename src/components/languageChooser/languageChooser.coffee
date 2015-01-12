angular.module "usability"
    .directive 'languageChooser', [ '$rootScope', ( $rootScope ) ->

        restrict: 'A'

        templateUrl: './components/languageChooser/languageChooser.html'

        link: ( scope, element, attrs ) ->

            scope.isVisible = true
            scope.countries = ['china', 'france', 'germany', 'portugal', 'spain', 'uk']

            scope.close = ->
                scope.isVisible = false
                $rootScope.$broadcast 'languageChooserIsVisible', scope.isVisible

]