Ember.Handlebars.helper "cardSetIcon", (code) ->
  img = "<img src='http://mtgimage.com/actual/symbol/set/#{code}/c/32.png'>"
  new Ember.Handlebars.SafeString img

