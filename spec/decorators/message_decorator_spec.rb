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

    it "returns a string containing the user's username" do
      expect(formatted_message).to match(/#{user.username}/)
    end

    it "returns a string with a timestamp" do
      expect(formatted_message).to match(/\[\d\d:\d\d ..\]/)
    end

    it "returns a string formatted as an html <p>" do
      expect(formatted_message).to match(/<p>.+<\/p>/)
    end
  end
end
