window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.LanguageChooserView = class LanguageChooserView extends Backbone.View

    el: '#language-chooser'

    template: $.get "./app/languageChooser/languageChooser.html"

    events:
        "click .flag" : "selectLanguage"

    data:
        countries: ['china', 'france', 'germany', 'portugal', 'spain', 'uk']

    initialize: ( options )->

        @blurEl = $('.page-wrapper')

        @render()
        @$el.remove() if options.disable


    render: ->

        @template.done ( tmpl ) =>
            @$el.html (_.template tmpl) @data

    show : ->
        @$el.fadeIn 50
        @render()


    selectLanguage : ( e ) ->

        @$el.fadeOut 500
        @trigger 'language', e.currentTarget.getAttribute("alt")

        $(@blurEl).addClass 'blur-transition'

        setTimeout =>
            $(@blurEl).removeClass 'blur'
            $(@blurEl).removeClass 'blur-transition'
        , 500

