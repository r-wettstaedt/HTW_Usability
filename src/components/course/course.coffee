window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CourseView = class LocationsView extends Backbone.View

    el: '#content'

    template        : $.get './components/course/course.html'
    getStates       : $.get './app/locations/states.json'
    getLanguages    : $.get './app/languages.json'
    getCourseInfo   : $.get './components/course/courses.json'

    state           : ''
    language        : ''
    courseInfo      : {}

    initialize: ( state, language ) ->

        return if !state? and !language?

        @getStates.done ( states ) =>
            @state = states[state].name

            @getLanguages.done ( languages ) =>
                @language = languages[language]

                @getCourseInfo.done ( courseInfo ) =>
                    @courseInfo = courseInfo

                    @render()


    render: ->
        
        @template.done ( tmpl ) =>

            data =
                state       : @state
                language    : @language
                courseInfo  : @courseInfo

            @$el.html (_.template tmpl) data