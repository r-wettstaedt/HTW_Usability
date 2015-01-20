class AppView extends Backbone.View

    el: 'body'

    events:
        "click ul.nav a" : 'handleNavigation'

    initialize: ->
        console.log this
        _.bindAll @, "handleNavigation"
        @render("main")


    render: ( template, options = {} ) ->

        $.get "./components/#{template}.html", ( data ) ->
            template = _.template data , options

            $('#content').html template


    handleNavigation : ( e ) ->

        view = e.currentTarget.getAttribute("data-view")
        if view
            @render view



window.AppView = new AppView()
