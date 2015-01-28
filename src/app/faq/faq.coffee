window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.FaqView = class EventsView extends Backbone.View

    el: '#content'

    template: $.get "./app/faq/faq.html"

    events: {}

    data: {}


    initialize: ->
        _.defer ->
            for el in $(".faces-widget")
                new Usability.Widgets.FacesWidget el : el
        @render()

    render: ->
        @template.done ( tmpl ) =>

            @$el.html (_.template tmpl) @data

