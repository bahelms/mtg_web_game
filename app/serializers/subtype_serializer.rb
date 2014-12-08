class SubtypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_type
  belongs_to :card
end

