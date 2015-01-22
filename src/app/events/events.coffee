window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.EventsView = class EventsView extends Backbone.View

    el: '#content'

    template: $.get "./app/events/events.html"

    events: {}

    data: {}


    initialize: ->
        @render()

    render: ->
        @template.done ( tmpl ) =>

            @$el.html (_.template tmpl) @data

            @calendar = new Usability.Views.CalendarView el: $('#calendar')
