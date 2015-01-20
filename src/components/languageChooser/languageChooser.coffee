angular.module "angular"
    .directive 'languageChooser', [ '$rootScope', '$timeout', ( $rootScope, $timeout ) ->

        restrict: 'A'

        templateUrl: './components/languageChooser/languageChooser.html'

        link: ( scope, element, attrs ) ->

            $rootScope.languageChooserIsVisible = true
            scope.countries = ['china', 'france', 'germany', 'portugal', 'spain', 'uk']

            scope.close = ->
                scope.transition = true
                $timeout ->
                    $rootScope.languageChooserIsVisible = false
                , 500

]