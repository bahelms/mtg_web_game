class Effect < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :ability
end
