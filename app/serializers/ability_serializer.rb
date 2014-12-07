class AbilitySerializer < ActiveModel::Serializer
  attributes :id, :type, :trigger, :cost, :effects
end

