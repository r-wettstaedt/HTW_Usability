window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CalendarView = class CalendarView extends Backbone.View

    initialize: ->

        @events = $.get './components/calendar/events.json'

        @events.done @render


    options :
        language      : 'de-DE'
        tmpl_path     : "./components/calendar/tmpls/"


    filter :
        course : null
        location : null


    render: =>

        options = _.extend @options, events_source : @getFilteredEvents()

        @calendar = @$el.calendar @options


    getFilteredEvents: =>
        events = @events.responseJSON.results

        events.filter ( e ) =>

            if @filter.course && e.course isnt @filter.course
                return false
            if @filter.location && e.location isnt @filter.location
                return false

            return true



    setFilter: ( newFilter ) =>

        @filter = newFilter

        @events.done @render



