window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.LocationsView = class LocationsView extends Backbone.View

    el: '#content'

    template: $.get "./app/locations/locations.html"

    events:
        'click [data-key]': 'selectLocation'

    initialize: ->
        @render()
        @info = new Usability.Views.LocationsInfoView()
        @info.on 'courseSelected', ( course ) =>
            @trigger 'courseSelected', course

    render: ->
        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl) {}
            @initMapster()


    selectLocation: ( e ) ->
        state = e.currentTarget.getAttribute 'data-key'
        @info.selectedState = state
        @info.render()


    initMapster: ->

        @$('#locations-map').mapster
            fillOpacity  : 0.5
            fadeInterval : 50
            mapKey : 'data-key'
            render_highlight:
                fillColor: '303AA6'
                stroke: true
            render_select:
                fillColor: 'ff000c'
                stroke: false

