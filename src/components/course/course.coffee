window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CourseView = class LocationsView extends Backbone.View

    el: '#content'

    template: $.get './components/course/course.html'
    getCourseInfo: $.get './components/course/courses.json'
    courseInfo: {}
    language: {}

    initialize: ->
        @render()

        @getCourseInfo.done ( courseInfo ) =>
            @courseInfo = courseInfo
            @render @language


    render: ( language ) ->
        @language = language
        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl) language: language, courseInfo: @courseInfo