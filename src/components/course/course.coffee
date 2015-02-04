window.Usability ?= {}
window.Usability.Views ?= {}
window.Usability.Views.CourseView = class LocationsView extends Backbone.View

    el              : '#content'

    events          :
        'click button'              : 'submit'
        'change #input-firstname'   : 'changed'
        'change #input-lastname'    : 'changed'
        'change #input-email'       : 'changed'
        'change #input-phone'       : 'changed'

    template        : $.get './components/course/course.html'
    getStates       : $.get './app/locations/states.json'
    getLanguages    : $.get './app/languages.json'
    getCourseInfo   : $.get './components/course/courses.json'

    state           : ''
    language        : ''
    courseInfo      : {}
    user            : { error: {} }

    initialize: ( options ) ->
        language = options.language
        state    = options.state

        return unless language and state

        @getStates.done ( states ) =>
            @state = states[state].name

            @getLanguages.done ( languages ) =>
                @language = languages[language]

                @getCourseInfo.done ( courseInfo ) =>
                    @courseInfo = courseInfo

                    @render()


    render: ->

        @template.done ( tmpl ) =>

            data =
                state       : @state
                language    : @language
                courseInfo  : @courseInfo
                user        : @user

            @$el.html (_.template tmpl) data


    submit: ->
        error = false
        if @user.firstname.length < 3
            error = true
            @user.error.firstname = 'Vorname muss mindestens drei Buchstaben enthalten'

        if @user.lastname.length  < 3
            error = true
            @user.error.lastname = 'Nachname muss mindestens drei Buchstaben enthalten'

        regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        if not regex.test @user.email
            error = true
            @user.error.email = 'Bitte geben Sie eine valide Email Adresse ein'

        regex = /[0-9]{6,15}/
        if @user.phone? and @user.phone.length > 0 and not regex.test @user.phone
            error = true
            @user.error.phone = 'Bitte geben Sie eine valide Telefonnummer ein'

        unless error
            @courseInfo.registeredParticipants++
            @courseInfo.registered = true
            @user = { error: {} }

        @render()

    changed: ( event ) ->
        @user.error = {}
        switch event.target.id
            when 'input-firstname' then @user.firstname = event.target.value
            when 'input-lastname'  then @user.lastname  = event.target.value
            when 'input-email'     then @user.email     = event.target.value
            when 'input-phone'     then @user.phone     = event.target.value




