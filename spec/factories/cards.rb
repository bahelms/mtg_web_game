FactoryGirl.define do
  factory :card do
    name "Spooky Card"
    rarity "common"
    colors [:black]
    card_set
    type Type.where(name: "creature").first
  end

  factory :card_set do
    name "Party 2015"
  end

  factory :ability do
    type "triggered"
    trigger "trigger:target:option"
    effects ["effect:result:option"]
    card
  end
end

