window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CourseView = class LocationsView extends Backbone.View

    el: '#content'

    template: $.get './components/course/course.html'

    initialize: ->
        @render()


    render: ( language ) ->
        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl) language: language