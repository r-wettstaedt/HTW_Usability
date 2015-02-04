window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.EventsView = class EventsView extends Backbone.View

    el: '#content'

    template: $.get "./app/events/events.html"

    events: {}

    eventPromise : $.get './components/calendar/events.json'

    states : $.get './app/locations/states.json'

    data : {}

    filter : {}

    initialize: ( options = {} ) ->
        @filter.location = options.location
        @render()


    getFilteredEvents: =>
        events = @eventPromise.responseJSON.results


        events.filter ( e ) =>

            if @filter.course && e.course isnt @filter.course
                return false
            if @filter.location && e.location isnt @filter.location
                console.log 2
                return false

            console.log 1
            return true

    render: ->
        @states.done ( states ) =>
            @eventPromise.done ( events ) =>

                @data.events = @getFilteredEvents()

                if @filter.location
                    @data.state = states[@filter.location]

                @template.done ( tmpl ) =>


                    @$el.html (_.template tmpl) @data

                    calendarData =
                        el: $('#calendar')
                        eventData : @getFilteredEvents()

                    if @state
                        calendarData.state = @state

                    @calendar = new Usability.Views.CalendarView calendarData


