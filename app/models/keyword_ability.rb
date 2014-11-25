class KeywordAbility < ActiveRecord::Base
  validates :keyword, presence: true, uniqueness: true
  has_and_belongs_to_many :cards
end
