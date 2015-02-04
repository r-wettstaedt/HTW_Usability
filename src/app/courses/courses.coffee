window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CoursesView = class LocationsView extends Backbone.View

    el: '#content'

    template: $.get "./app/courses/courses.html"
    languages: $.get "./app/languages.json"
    states: $.get "./app/locations/states.json"

    events:
        'click [data-key]': 'selectLocation'

    data:
        languages : []

    initialize: ->

        @languages.done ( languages ) =>

            l.count = 0 for l in languages

            @states.done ( states ) =>

                for k, v of states
                    for c in v.courses
                        for l in languages when l.key is c
                            l.count++


                @data.languages = languages

                @render()

    render: ->
        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl) @data

