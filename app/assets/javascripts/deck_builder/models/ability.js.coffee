DeckBuilder.Ability = DS.Model.extend
  type: DS.attr("string")
  ability_trigger: DS.attr("string")
  cost: DS.attr("string")
  effects: DS.attr("string")
  card: DS.belongsTo("card")

