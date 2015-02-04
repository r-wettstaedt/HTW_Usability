window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CalendarView = class CalendarView extends Backbone.View

    initialize: ( options ) ->

        @data =
            events : options.eventData

        @render()


    options :
        language      : 'de-DE'
        tmpl_path     : "./components/calendar/tmpls/"
        views:
            year  : enable: 1
            month : enable: 1
            week  : enable: 0
            day   : enable: 0



    render: =>

        options = _.extend @options, events_source : @data.events

        @calendar = @$el.calendar @options



    setFilter: ( newFilter ) =>

        @filter = newFilter

        @events.done @render



