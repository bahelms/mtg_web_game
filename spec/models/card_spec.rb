require "rails_helper"

describe Card do
  let(:card) do
    build(:card) do |card|
      2.times { card.abilities.build(attributes_for(:ability)) }
      card.keyword_abilities << KeywordAbility.first
    end
  end

  describe "#all_abilities" do
    it "returns all abilities and keyword abilities" do
      expect(card.all_abilities.size).to eq 3
    end
  end
end
