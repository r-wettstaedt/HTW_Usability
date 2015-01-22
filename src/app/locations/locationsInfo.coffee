window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.LocationsInfoView = class LocationsView extends Backbone.View

    el            : '#locations-info'

    template      : $.get './app/locations/locationsInfo.html'
    getStates     : $.get './app/locations/states.json'
    getLanguages  : $.get './app/languages.json'

    languages     : []
    states        : {}
    selectedState : ''
    data          : {}

    initialize: ->
        @getStates.done ( states ) =>
            @states = states
        @getLanguages.done ( languages ) =>
            @languages = languages
            console.log @languages

    render: ->
        @template.done ( tmpl ) =>
            @data = @states[@selectedState]
            @data.getCountryFromCode = @getCountryFromCode
            @data.languages = @languages
            @$el.html (_.template tmpl) @data

    getCountryFromCode: ( code ) ->
        console.log @languages
        @languages[code]