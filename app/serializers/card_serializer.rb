class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :mana_cost, :colors, :rarity, :power, :toughness,
    :dual_card, :card_set_id, :type_id, :supertype_id, :type_class_id
  has_many :keyword_abilities
  has_many :abilities
  has_many :subtypes
end

