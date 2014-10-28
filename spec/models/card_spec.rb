require "rails_helper"

describe Card do
  let(:card) { create(:card) }

  describe "#all_abilities" do
    it "returns all abilities and keyword abilities" do
      expect(card.all_abilities.size).eq 3
    end
  end
end
