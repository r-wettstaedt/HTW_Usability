window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.LocationsView = class LocationsView extends Backbone.View

    el: '#content'

    template: $.get "./app/locations/locations.html"

    events:
        'click [data-key]': 'selectLocation'

    initialize: ->
        @render()

    render: ->
        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl) {}
            @initMapster()


    selectLocation: ( e ) ->
        state = e.currentTarget.getAttribute 'data-key'
        @trigger 'stateSelected', state


    initMapster: ->

        @$('#locations-map').mapster
            singleSelect: true
            fillOpacity  : 1.0
            listSelectedClass: "country-selected"
            fadeInterval : 50
            mapKey : 'data-key'
            render_highlight:
                fillColor: 'e74c3c'
                stroke: false
            render_select:
                fillColor: 'f1c40f'
                stroke: false

