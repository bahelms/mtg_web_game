DeckBuilder.CardsRoute = Ember.Route.extend
  model: -> @store.find "card"

