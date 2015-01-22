window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.AppView = class AppView extends Backbone.View

    el: 'body'

    events:
        "click ul.nav a" : 'handleNavigation'

    initialize: ->
        _.bindAll @, "handleNavigation"


        @render 'main'

        @c  = new Usability.Views.CourseView()
        @lc = new Usability.Views.LanguageChooserView()
        @lc.on 'language', ( country ) ->


    render: ( view ) ->

        if view is 'locations'
            @l = new Usability.Views.LocationsView()
            @l.on 'courseSelected', ( course ) =>
                @c.render course

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

        $('ul.nav a.active').removeClass "active"

        view = e.currentTarget.getAttribute("data-view")
        e.currentTarget.classList.add "active"

        if view
            @render view


$ ->
    window.Usability.App = new AppView()
