class Ability < ActiveRecord::Base
  self.inheritance_column = :not_type
  validates :type, presence: true
  has_and_belongs_to_many :cards
  has_many :effects
end
