class AppView extends Backbone.View

    el: 'body'

    events:
        "click ul.nav a" : 'handleNavigation'

    initialize: ->
        console.log this
        _.bindAll @, "handleNavigation"



        @render "main", =>
            @initMainPage()


    render: ( template, options = {}, cb ) ->

        if typeof options is 'function'
            cb = options

        $.get "./components/#{template}.html", ( data ) ->
            template = _.template data , options

            $('#content').html template
            cb?()





    handleNavigation : ( e ) ->

        view = e.currentTarget.getAttribute("data-view")
        if view
            @render view


    initMainPage : ->
        $(".input-prepend, .input-append").on 'focus', 'input', ->
            $(this).closest('.control-group, form').addClass 'focus'

        .on 'blur', 'input', ->
            $(this).closest('.control-group, form').removeClass 'focus'

        do ( el = $(".content-10") ) ->
            console.log el
            $(window).resize ->

                if not $("> img", el).hasClass("ani-processed")
                    console.log
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


window.AppView = new AppView()
