class AbilitySerializer < ActiveModel::Serializer
  attributes :id, :type, :trigger, :cost, :effects, :card

  def card
    object.card.id
  end
end

