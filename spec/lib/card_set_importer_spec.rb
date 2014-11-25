require "rails_helper"

describe CardSetImporter do
  let(:importer_params) do
    { csv_name: "test_csv", path: "#{Rails.root}/spec/support/" }
  end
  let(:test_csv) do
    File.read("#{importer_params[:path]}#{importer_params[:csv_name]}.csv").
      split("\n")
  end

  subject { described_class.new(importer_params) }

  describe "#initialize" do
    it "requires a csv file name" do
      expect { described_class.new(trash: :trash) }.to raise_error(KeyError)
    end
  end

  describe "#card_set_name" do
    it "returns the name of the CardSet" do
      expect(subject.card_set_name).to eq test_csv.first
    end
  end

  describe "#import" do
    context "when that CardSet already exists" do
      it "destroys that CardSet" do
        set = CardSet.create(name: "New Card Set")
        subject.import
        expect(set.id).not_to eq CardSet.first.id
      end
    end

    it "saves a new CardSet" do
      subject.import
      expect(CardSet.first.name).to eq test_csv.first
    end

    it "saves all the Cards specified in the file to the new CardSet" do
      subject.import
      card_count = test_csv.size - 1
      expect(Card.where(card_set: CardSet.first).size).to eq card_count
    end

    it "saves all card abilities specified in the file" do
      subject.import
      cards = Card.where(card_set: CardSet.first)
      abilities_count = cards.reduce(0) do |sum, card|
        sum + card.abilities.count + card.keyword_abilities.count
      end
      expect(abilities_count).to eq total_abilities_in_test_csv
    end
  end

  def total_abilities_in_test_csv
    test_csv.map { |row| row.split("%").size - 1 }.reduce(&:+)
  end
end

