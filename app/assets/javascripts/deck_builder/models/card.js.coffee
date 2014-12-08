DeckBuilder.Card = DS.Model.extend
  name: DS.attr("string")
  manaCost: DS.attr("string")
  colors: DS.attr("string")
  rarity: DS.attr("string")
  power: DS.attr("number")
  toughness: DS.attr("number")
  dualCard: DS.attr("boolean")

  cardSet: DS.belongsTo("card_set")
  type: DS.belongsTo("type")
  supertype: DS.belongsTo("supertype")
  typeClass: DS.belongsTo("type_class")
  subtypes: DS.hasMany("subtype")
  # keywordAbilities: DS.hasMany("keyword_ability")
  # abilities: DS.hasMany("ability")
  
