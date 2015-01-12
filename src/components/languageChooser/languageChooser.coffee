angular.module "usability"
    .directive 'languageChooser', [ '$rootScope', '$timeout', ( $rootScope, $timeout ) ->

        restrict: 'A'

        templateUrl: './components/languageChooser/languageChooser.html'

        link: ( scope, element, attrs ) ->

            scope.isVisible = true
            scope.countries = ['china', 'france', 'germany', 'portugal', 'spain', 'uk']

            scope.close = ->
                scope.transition = true
                $rootScope.$broadcast 'languageChooserIsVisible', false
                $timeout ->
                    scope.isVisible = false
                , 500

]