window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.LocationsView = class LocationsView extends Backbone.View

    el: '#content'

    template: $.get "./app/locations/locations.html"

    events:
        'click [data-key]': 'selectLocation'
    data:
        selectedState: ''

    initialize: ->
        @render()

    render: ->
        @template.done ( tmpl ) =>
            console.log "now"
            @$el.html (_.template tmpl) @data
            @initMapster()


    selectLocation: ( e ) ->
        state = e.currentTarget.getAttribute 'data-key'
        @data.selectedState = state


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

