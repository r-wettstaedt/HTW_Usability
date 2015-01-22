window.Usability ?= {}
window.Usability.Widgets ?= {}
window.Usability.Widgets.FacesWidget = class CalendarView extends Backbone.View

    template: $.get "./components/faces/faces.html"

    events: {}

    data:
        people : [
            {
                photo : "http://www.gravatar.com/avatar/9a7cac8a1e97242ac20a8a716a1f2665.png?s=200"
                quote : "Wow, I never though learning klingon would be so easy. SLS Sprachschule really is the best!!!11"
                name  : "Torsten Rüter"
            },
            {
                photo : "http://www.gravatar.com/avatar/d98bf69bf82242da71873132a331cdfe?s=200"
                quote : "I've learned almost every word of Plattdeutsch in two days. If only the grammar wasn't so hard. But SLS Sprachschule is really fun."
                name  : "Robert Wettstädt"
            },
            {
                photo: "http://www.gravatar.com/avatar/5ea8ae3538c176ed08c5f05a5b91ef1e.png?s=200"
                quote: "Thanks to SLS, I can now speak Klingon while attending ALL THE CONVENTIONS! Thanks SLS!"
                name: "Markus Bausdorf"
            },
            {
                photo : "http://www.gravatar.com/avatar/f45a23430a50052a14dec51656cf7d40.png?s=200"
                quote : "I don't know anything about the site, but SLS Sprachschule is really cool."
                name  : "Tobias Scholz"
            }
        ]



    initialize: ->

        @render()

    render: ->

        @template.done ( tmpl ) =>

            @data.people = _.shuffle @data.people

            @$el.html (_.template tmpl) @data

