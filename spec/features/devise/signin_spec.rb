require "rails_helper"
require "support/authentication"

feature "Signing in with an existing account" do
  let(:user) { create(:user) }
  subject { page }
  background { visit root_path }

  it { should have_content("Sign In") }
  it { should have_field("Email") }
  it { should have_field("Password") }

  context "with valid input" do
    scenario "successfully signs in user if email and password are valid" do
      sign_in_with email: user.email, password: user.password
      expect(page).not_to have_content("Invalid email or password")
    end
  end

  context "with invalid email or password" do
    scenario "notifies user if the email is invalid" do
      sign_in_with email: nil, password: user.password
      expect(page).to have_content("Invalid email or password")
    end

    scenario "notifies user if the password is invalid" do
      sign_in_with email: user.email, password: "waht_me_worry?"
      expect(page).to have_content("Invalid email or password")
    end
  end
end

