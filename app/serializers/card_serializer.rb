class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :mana_cost, :colors, :rarity, :power, :toughness,
    :dual_card, :card_set, :type, :supertype, :type_class
  has_many :keyword_abilities, embed: :ids, include: true
  has_many :abilities, embed: :ids, include: true
  has_many :subtypes, embed: :ids, include: true

  def card_set
    object.card_set.name
  end

  def type
    object.type.name.capitalize
  end

  def supertype
    object.supertype.name if object.supertype
  end

  def type_class
    object.type_class.name if object.type_class
  end
end

