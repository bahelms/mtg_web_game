class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :mana_cost, :colors, :rarity, :power, :toughness,
    :dual_card, :card_set, :type, :supertype, :type_class
end
