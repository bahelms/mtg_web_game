require "rails_helper"

describe MessageDecorator do
  let(:user) { create(:user) }
  subject { described_class }

  describe "#empty?" do
    it "returns true when message is an empty string" do
      expect(subject.new("", user).empty?).to eq true
    end

    it "returns true when message is nil" do
      expect(subject.new(nil, user).empty?).to eq true
    end
  end

  describe "#format" do
    let(:message) { "Hey there" }
    let(:formatted_message) { subject.new(message, user).format }

    it "returns a string of this specified format" do
      format = /\[\d\d:\d\d ..\] #{user.username}: #{message}/
      expect(formatted_message).to match(format)
    end
  end
end
