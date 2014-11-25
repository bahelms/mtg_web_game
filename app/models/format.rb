class Format < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :card_sets
end

