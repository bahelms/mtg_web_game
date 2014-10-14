require "rails_helper"
require "support/authentication"

feature "Visit the Deck Builder" do
  given(:user) { create(:user, username: "Tiberius") }
  subject { page }

  background do
    sign_in user
    click_link "Deck Builder"
  end

  it { pending "Take the Ember tutorial first"; fail }
end
