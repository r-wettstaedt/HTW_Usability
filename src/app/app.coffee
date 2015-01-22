window.Usability ?= {}
window.Usability.View ?= {}
window.Usability.Views.AppView = class AppView extends Backbone.View

    el: 'body'

    events:
        "click a.nav-link" : 'handleNavigation'

    initialize: ->
        _.bindAll @, "handleNavigation"


        @render 'main'

        @lc = new Usability.Views.LanguageChooserView()
        @lc.on 'language', ( country ) ->


        # Setup bottom navigation
        clone = $('#top-nav > ul').clone()
        $('#bottom-nav').append( clone ).find('ul').removeClass "nav"



    render: ( view ) ->

        if view is 'locations'
            new Usability.Views.LocationsView()

        if view is 'main'
            new Usability.Views.MainView()

        if view is 'trips'
            new Usability.Views.MainView()

        if view is 'events'
            new Usability.Views.EventsView()

        if view is 'faq'
            new Usability.Views.FaqView()

        _.defer ->
            for el in $(".faces-widget")
                new Usability.Widgets.FacesWidget el : el


    handleNavigation : ( e ) ->

        $links = $('a.nav-link')
        $links.removeClass "active"

        view = e.currentTarget.getAttribute("data-view")

        for l in $links when l.getAttribute("data-view") is view
            l.classList.add "active"

        if view
            @render view


$ ->
    window.Usability.App = new AppView()
