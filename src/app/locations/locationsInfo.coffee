window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.LocationsInfoView = class LocationsInfoView extends Backbone.View

    el            : '#locations-info'

    template      : $.get './app/locations/locationsInfo.html'
    getStates     : $.get './app/locations/states.json'
    getLanguages  : $.get './app/languages.json'

    languages     : []
    selectedState : {}

    initialize: ( options ) ->

        state = options.state

        @getStates.done ( states ) =>

            @selectedState = states[state]
            @selectedState.code = state

            @getLanguages.done ( languages ) =>
                @languages = languages

                @render()

    render: ->

        @template.done ( tmpl ) =>
            # bind to this to access this.getCourseFromCode without appending it to data object
            _render = _.template( tmpl ).bind( @ )

            data = @selectedState
            #data.getCourseFromCode = @getCourseFromCode
            data.languages = @languages

            # AND to access @selected state in template :)
            @$el.html _render data

    getCourseFromCode: ( code ) ->
        @languages[code]
