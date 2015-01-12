angular.module 'usability'

.controller 'MainCtrl', ( $rootScope, $scope, $timeout, $mdSidenav, $log ) ->

    $scope.languageChooserIsVisible = false
    $rootScope.$on 'languageChooserIsVisible', ( event, isVisible ) ->
        $scope.languageChooserIsVisible = isVisible

    $scope.toggleLeft = ->

        $mdSidenav('left').toggle()


    $scope.sections = [{
        name: 'Kurse',
        pages: [{
              name: 'Deutsch',
              id: 'DE',
              url: '/'
            },{
              name: 'Englisch',
              id: 'EN',
              url: '/'
            }
        ] }, {
            name: 'Sprachreisen',
            pages: []
        }, {
            name: 'Eventkalender',
            pages: []
        }, {
            name: 'Standortübersicht',
            pages: []
        }, {
            name: 'Einstufungstest',
            pages: []
        }, {
            name: 'Zertifikate',
            pages: []
        }, {
            name: 'FAQ',
            pages: []
    }]

    $scope.selectSection = (section) ->
        $scope.openedSection = section

    $scope.toggleSelectSection = (section) ->
        $scope.openedSection = if $scope.openedSection is section then null else section

    $scope.isSectionSelected = (section) ->
        $scope.openedSection is section

    $scope.selectPage = (section, page) ->
        page && page.url && $location.path(page.url)
        $scope.currentSection = section
        $scope.currentPage = page

    $scope.isPageSelected = (section, page) ->
        $scope.currentPage is page
