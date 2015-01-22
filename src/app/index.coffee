class AppView extends Backbone.View

    el: 'body'

    events:
        "click ul.nav a" : 'handleNavigation'

    initialize: ->
        console.log this
        _.bindAll @, "handleNavigation"


        @render "main", =>
            @initMainPage()

            blur = new BlurView()
            lc = new LanguageChooserView()
            lc.on 'language', ( country ) ->
                blur.disappear()


    render: ( template, options = {}, cb ) ->

        if typeof options is 'function'
            cb = options

        console.log "trying to render #{template}"
        if template is 'standorte'
            new LocationsView()

#        $.get "./components/#{template}.html", ( data ) ->
#            template = _.template data , options
#
#            $('#content').html template
#            cb?()
        cb?()


    handleNavigation : ( e ) ->

        view = e.currentTarget.getAttribute("data-view")
        console.log "clicked ", view
        if view
            @render view


    initMainPage : ->
        $(".input-prepend, .input-append").on 'focus', 'input', ->
            $(this).closest('.control-group, form').addClass 'focus'

        .on 'blur', 'input', ->
            $(this).closest('.control-group, form').removeClass 'focus'

        do ( el = $(".content-10") ) ->

            $(window).resize ->

                return unless el?.length

                if not $("> img", el).hasClass("ani-processed")

                    el.data "scrollPos", el.offset().top - $(window).height() + el.outerHeight() - parseInt(el.css("padding-bottom"), 10)

            .scroll ->
                if not $("> img", el).hasClass("ani-processed")
                    if $(window).scrollTop() >= el.data("scrollPos")
                        $("> img", el).addClass "ani-processed"
                        $(".box", el).each (idx) ->
                            $(this).delay(idx * 200).animate
                                fake: 0
                            , 1, "linear", -> $(this).addClass "ani-processed"



        $(window).load ->
            $("html").addClass "loaded"
            $(window).resize().scroll()
            return



class LocationsView extends Backbone.View

    el: '#content'

    initialize: ->
        console.log "init loc view"

        @render =>
            console.log @$el
            @$('#locations-map').mapster
                fillOpacity: 0.5
                render_highlight: {
                    fillColor: '303AA6'
                    stroke: true
                }
                render_select: {
                    fillColor: 'ff000c'
                    stroke: false
                }
                fadeInterval: 50,
                mapKey: 'data-key'


    render : ( cb ) ->
        $.get "./app/locations.html", ( data ) =>
            template = _.template data , {}

            @$el.html template
            cb?()



class LanguageChooserView extends Backbone.View

    el: '#language-chooser'

    template : null

    events:
        "click .flag" : "selectLanguage"

    initialize: ->

        @$el.remove()

        $.get "./components/languageChooser.html", ( data ) =>
            @template = _.template data
            @show()

        this.countries = ['china', 'france', 'germany', 'portugal', 'spain', 'uk']



    render : ( cb ) ->

        @$el.html @template countries: @countries

        cb?()



    show : ->
        @$el.fadeIn 50
        @render()


    selectLanguage : ( e ) ->

        @$el.fadeOut 500
        @trigger 'language', e.currentTarget.getAttribute("alt")


class BlurView extends Backbone.View 

    el: '.page-wrapper'

    template : null

    initialize: ->

        # $(@el).addClass 'blur'
        console.log "render blur"

    disappear: ->

        $(@el).addClass 'blur-transition'
        setTimeout ->
            $(@el).removeClass 'blur'
            $(@el).removeClass 'blur-transition'
        , 500


window.AppView = new AppView()
