class Type < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :permanent, inclusion: [true, false]
  has_many :cards
end
