window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.AppView = class AppView extends Backbone.View

    el: 'body'

    initialize: ->

        @initRouter()

        @lc = new Usability.Views.LanguageChooserView disable : false
        # @lc.on 'language', ( country ) ->


        # Setup bottom navigation
        clone = $('#top-nav > ul').clone()
        $('#bottom-nav').append( clone ).find('ul').removeClass "nav"


    initRouter: ->

        @router = new Usability.Router()

        scrollToTop = ->
            $("html,body").scrollTop(0 )


        @router.on 'route:default', ->
            scrollToTop()
            new Usability.Views.MainView()

        @router.on 'route:locations', =>
            scrollToTop()
            @l = new Usability.Views.LocationsView()
            @l.on 'stateSelected', ( state ) =>
                @router.navigate "locations/#{state}", trigger: true

        @router.on 'route:location', ( state ) =>
            if @l?
                @li = new Usability.Views.LocationsInfoView state: state
            else
                @router.navigate "locations", trigger: true

        @router.on 'route:course', ( state, language ) ->
            new Usability.Views.CourseView state: state, language: language

        @router.on 'route:courses', ( state, language ) ->
            scrollToTop()
            new Usability.Views.CoursesView state: state, language: language

        @router.on 'route:calendar', ->
            scrollToTop()
            if arguments[0]
                new Usability.Views.EventsView location: arguments[0]
            else
                new Usability.Views.EventsView()


        @router.on 'route:faq', ->
            scrollToTop()
            new Usability.Views.FaqView()




        # NOT WORKING?!
        # @router.navigate Backbone.history.fragment, trigger: true

        Backbone.history.start( root: '' )


window.Usability.Router = class Router extends Backbone.Router

    routes:
        '': 'default'
        'home': 'default'
        'courses': 'courses'
        'locations': 'locations'
        'locations/:state': 'location'
        'locations/:state/:language': 'course'
        'events': 'calendar'
        'events/:state': 'calendar'
        'faq': 'faq'


$ ->
    window.Usability.App = new AppView()
