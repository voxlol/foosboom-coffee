Template.teams.helpers

    isCreatingTeam: () ->
        Session.get 'isCreatingTeam'

    teams: () -> # this contains the data for the teams
        Teams.find()

Template.teams.events

    'click a.create': (e,tpl) ->
        e.preventDefault()
        Session.set 'isCreatingTeam',true

    'click a.cancel': (e,tpl) ->
        e.preventDefault()
        Session.set 'isCreatingTeam',false

    'submit form.create-team': (e,tpl) ->
        e.preventDefault()
        teamName = tpl.$('input[name=name]').val()
        Teams.insert {name: teamName}, (error,_id) ->
            if error
                alert error
                Session.set 'isCreatingTeam', true
                Tracker.afterFlush ->
                    tpl.$('input[name=name]').val(teamName)


        Session.set 'isCreatingTeam',false

