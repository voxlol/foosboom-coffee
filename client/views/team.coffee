Template.team.helpers
    isEditingTeam: () ->
        Session.get('editedTeamId') == this._id

Template.team.events
    'submit form.form-edit': (e,tpl) ->
        e.preventDefault()

        teamName = tpl.$('input[name="name"]').val()
        if teamName.length
            Teams.update(this._id,{$set:{name:teamName}})
            Session.set 'editedTeamId', null

    'click a.edit': (e,tpl) ->
        e.preventDefault()
        Session.set 'editedTeamId', this._id

    'click a.cancel': (e,tpl) ->
        e.preventDefault()
        Session.set 'editedTeamId',null

    'click a.remove': (e,tpl) ->
        e.preventDefault()
        Teams.remove(this._id)
