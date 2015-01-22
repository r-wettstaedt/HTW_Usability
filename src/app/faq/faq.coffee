window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.FaqView = class EventsView extends Backbone.View

    el: '#content'

    template: $.get "./app/faq/faq.html"

    events: {}

    data: {}


    initialize: ->
        @render()

    render: ->
        @template.done ( tmpl ) =>

            @$el.html (_.template tmpl) @data

