class AbilitySerializer < ActiveModel::Serializer
  attributes :id, :type, :ability_trigger, :cost, :effects

  def ability_trigger
    object.trigger
  end
end

