class Card < ActiveRecord::Base
  validates :name, :color, :rarity, :set_id, :type_id, presence: true

  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :decks

  belongs_to :card_set
  belongs_to :supertype
  belongs_to :type
  belongs_to :subtype
  belongs_to :type_class
end

