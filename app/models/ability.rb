class Ability < ActiveRecord::Base
  validates :type, presence: true
  has_and_belongs_to_many :cards
end
