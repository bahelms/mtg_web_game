require "rails_helper"
require "support/authentication"

feature "Reseting password" do
  let(:user) { create(:user) }
  let(:mail) { ActionMailer::Base.deliveries.first }
  subject { page }

  background do
    visit root_path
    click_link "Forgot your password?"
  end

  context "with valid email address" do
    background { fill_in "Email", with: user.email }

    scenario "sends the user an email with a reset password link" do
      expect {
        click_button "Send reset password instructions"
      }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end

    scenario "sends an email to the address provided" do
      click_button "Send reset password instructions"
      expect(mail.to).to eq [user.email]
    end
  end

  context "with nonexistant email address" do
    scenario "displays error message" do
      pending
    end
  end
end
