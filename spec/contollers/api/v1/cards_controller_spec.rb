require "rails_helper"
require "support/api_authentication"

describe Api::V1::CardsController, type: :controller do
  let(:user) { double("user") }

  before do
    authenticate
    4.times { create_card }
  end

  describe "GET #index" do
    it "returns all cards" do
      get :index, format: :json
      expect(JSON.parse(response.body)["cards"].count).to eq 4
    end
  end

  def create_card
    create(:card) do |card|
      2.times { card.abilities.create(attributes_for(:ability)) }
      card.keyword_abilities << KeywordAbility.first
    end
  end
end

