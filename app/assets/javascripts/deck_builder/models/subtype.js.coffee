DeckBuilder.Subtype = DS.Model.extend
  name: DS.attr("string")
  cards: DS.hasMany("card")
