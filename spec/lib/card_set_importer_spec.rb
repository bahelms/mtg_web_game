require "rails_helper"

describe CardSetImporter do
  let(:importer_params) do
    { csv_name: "test_csv", path: "#{Rails.root}/spec/lib/" }
  end
  let(:test_csv) do
    File.read("#{importer_params[:path]}#{importer_params[:csv_name]}.csv").
      split("\n")
  end

  subject { described_class.new(importer_params) }

  describe "#initialize" do
    it "requires a csv file name" do
      expect { described_class.new(path: "") }.to raise_error(KeyError)
    end

    it "requires a default path for the csv file" do
      expect { described_class.new(csv_name: "") }.to raise_error(KeyError)
    end
  end

  describe "#card_set_name" do
    it "returns the name of the CardSet" do
      expect(subject.card_set_name).to eq test_csv.first
    end
  end

  describe "#import" do
    before { subject.import }

    it "saves a new CardSet" do
      expect(CardSet.first.name).to eq test_csv.first
    end

    it "saves all the Cards specified in the file to the new CardSet" do
      card_count = test_csv.size - 1
      expect(Card.where(card_set_id: CardSet.first.id).size).to eq card_count
    end
  end
end

