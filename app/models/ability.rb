class Ability < ActiveRecord::Base
  self.inheritance_column = :not_type
  validates :type, presence: true
  belongs_to :card
end
