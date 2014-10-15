class Type < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :permanent, inclusion: [true, false]
end
