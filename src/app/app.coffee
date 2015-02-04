window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.AppView = class AppView extends Backbone.View

    el: 'body'

    initialize: ->

        @initRouter()

        @lc = new Usability.Views.LanguageChooserView disable : true
        # @lc.on 'language', ( country ) ->


        # Setup bottom navigation
        clone = $('#top-nav > ul').clone()
        $('#bottom-nav').append( clone ).find('ul').removeClass "nav"


    initRouter: ->

        @router = new Usability.Router()


        @router.on 'route:default', ->
            new Usability.Views.MainView()

        @router.on 'route:locations', =>
            @l = new Usability.Views.LocationsView()
            @l.on 'stateSelected', ( state ) =>
                @router.navigate "locations/#{state}", trigger: true

        @router.on 'route:location', ( state ) =>
            @li = new Usability.Views.LocationsInfoView state: state

        @router.on 'route:course', ( state, language ) ->
            new Usability.Views.CourseView state: state, language: language

        @router.on 'route:courses', ( state, language ) ->
            new Usability.Views.CoursesView state: state, language: language

        @router.on 'route:calendar', ->
            new Usability.Views.EventsView()

        @router.on 'route:events', ->
            new Usability.Views.EventsView()



        @router.on 'route:faq', ->
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
        'events/:state': 'events'
        'faq': 'faq'


$ ->
    window.Usability.App = new AppView()
