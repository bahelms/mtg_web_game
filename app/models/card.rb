class Card < ActiveRecord::Base
  validates :name, :color, :rarity, :set_id, :type_id, presence: true
end
