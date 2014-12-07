class KeywordAbilitySerializer < ActiveModel::Serializer
  attributes :id, :keyword, :effects, :cost
end
