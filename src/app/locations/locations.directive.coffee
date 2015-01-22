angular.module 'angular'
    .directive 'germanyMap', () ->

        restrict: 'A'

        link: ( scope, element, attrs ) ->

            $(element).mapster
                fillOpacity: 0.5
                render_highlight: {
                    fillColor: '303AA6'
                    stroke: true
                }
                render_select: {
                    fillColor: 'ff000c'
                    stroke: false
                }
                fadeInterval: 50,
                mapKey: 'data-key'