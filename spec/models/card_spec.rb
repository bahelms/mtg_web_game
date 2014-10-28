require "rails_helper"

describe Card do
  before do
    CardSetImporter.new(csv_name: "test_csv", path: "#{Rails.root}/spec/support/").import
  end

  subject { described_class }

  describe "#abilities" do
    it "returns all abilities and keyword abilities" do
      pending
      fail
    end
  end
end
