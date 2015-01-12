window.App.directive 'languageChooser', [ ->

    restrict: 'A'

    link: ( scope, element, attrs ) ->

        scope.countries = ['china', 'france', 'germany', 'portugal', 'spain', 'uk']
