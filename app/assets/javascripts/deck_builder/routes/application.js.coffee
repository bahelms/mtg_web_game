DeckBuilder.ApplicationRoute = Ember.Route.extend
  model: -> @store.find "card"

