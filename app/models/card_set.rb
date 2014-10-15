class CardSet < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :formats
  has_many :cards
end

