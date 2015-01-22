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
            singleSelect: true
            fillOpacity  : 0.8
            fadeInterval : 50
            mapKey : 'data-key'
            render_highlight:
                fillColor: 'f1c40f'
                stroke: false
            render_select:
                fillColor: '3498db'
                stroke: false

