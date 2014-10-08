require "rails_helper"

describe UsersListPresenter do
  let(:bob) { create(:user) }
  let(:alice) { create(:user, username: "Alice", email: "alice@foobar.com") }
  let(:jeff) { create(:user, username: "Jeff", email: "jeff@mcjeff.com") }
  let(:all_users) { [bob, alice, jeff] }
  subject { described_class }

  describe "#initialize" do
    it "expects an array of user objects" do
      expect(subject.new(all_users).users.size).to eq 3
    end
  end

  describe "#format" do
    let(:users_list) { subject.new(all_users).format }

    it "returns a string containing all of the connected user's usernames" do
      regex = /(#{bob.username}).*(#{alice.username}).*(#{jeff.username})/
      expect(users_list.match(regex).size).to eq(all_users.size + 1)
    end

    it "returns a string inside html <p>" do
      regex = /^<p>.+<\/p>/
      expect(users_list).to match(regex)
    end
  end
end

