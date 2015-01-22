window.Usability ?= {}
window.Usability.View ?= {}
window.Usability.Views.AppView = class AppView extends Backbone.View

    el: 'body'

    events:
        "click ul.nav a" : 'handleNavigation'

    initialize: ->
        _.bindAll @, "handleNavigation"


        @render "main"

        @lc = new Usability.Views.LanguageChooserView()
        @lc.on 'language', ( country ) ->


    render: ( view ) ->

        if view is 'locations'
            new Usability.Views.LocationsView()

        if view is 'main'
            new Usability.Views.MainView()

        if view is 'trips'
            new Usability.Views.MainView()

        if view is 'events'
            new Usability.Views.EventsView()

    handleNavigation : ( e ) ->

        $('ul.nav a.active').removeClass "active"

        view = e.currentTarget.getAttribute("data-view")
        e.currentTarget.classList.add "active"

        if view
            @render view



window.Usability.App = new AppView()
