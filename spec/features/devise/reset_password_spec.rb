require "rails_helper"
require "support/authentication"

feature "Reseting password" do
  given(:user) { create(:user) }
  subject { page }

  background do
    visit root_path
    click_link "Forgot your password?"
  end

  scenario "sends the user an email with a reset password link" do
    fill_in "Email", with: user.email
    expect {
      click_button "Send reset password instructions"
    }.to change(ActionMailer::Base.deliveries, :count).by(1)
  end
end

