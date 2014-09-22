require "rails_helper"
require "support/authentication"

feature "Reseting password" do
  let(:user) { create(:user) }
  subject { page }

  background do
    visit root_path
    click_link "Forgot your password?"
  end

  scenario "sends the user an email with a reset password link" do
    fill_in "Email", with: user.email
    click_button "Send reset password instructions"
  end
end
