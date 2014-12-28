Ember.Handlebars.helper "manaCostImages", (manaCost) ->
  manaCostHtml = ""
  for color, amount of manaCost
    manaCostHtml 
  new Ember.Handlebars.SafeString manaCostHtml
