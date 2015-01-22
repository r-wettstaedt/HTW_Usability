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

    events        :
        'click a' : 'courseSelected'

    initialize: ->
        @getStates.done ( states ) =>
            @states = states
        @getLanguages.done ( languages ) =>
            @languages = languages

    render: ->
        @template.done ( tmpl ) =>
            @data = @states[@selectedState]
            @data.getCountryFromCode = @getCountryFromCode
            @data.languages = @languages
            @$el.html (_.template tmpl) @data

    getCountryFromCode: ( code ) ->
        @languages[code]

    courseSelected: ( e ) ->
        @trigger 'courseSelected', e.currentTarget.getAttribute 'data-id'