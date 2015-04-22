Meteor.startup ->
    if Teams.find().count() == 0
        [
            {name: "Barcelona"}
            {name: "Real Madrid"}
            {name: "Matt's Team"}
        ].forEach (team) -> 
            Teams.insert team