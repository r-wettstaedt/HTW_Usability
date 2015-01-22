window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.MainView = class MainView extends Backbone.View

    el: '#content'

    template : $.get "./app/main/main.html"

    events:
        "click .flag" : "selectLanguage"

    initialize: ->
        @render()

        @initStartupFramework()

    render: ->
        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl), {}


    initStartupFramework: ->
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


