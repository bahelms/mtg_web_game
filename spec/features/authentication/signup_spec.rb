require "rails_helper"
require "support/authentication"

feature "Signing up for a new account" do
  let(:old_user) { create(:user) }
  subject { page }

  background do
    visit root_path
    click_link "New Account"
  end

  it { should have_content("Create Account") }
  it { should have_field("Email") }
  it { should have_field("Username") }
  it { should have_field("Password") }
  it { should have_field("Confirm password") }

  context "with valid input" do
    scenario "creates a new account if email and password are valid" do
      signup_with email: "heybob@foobar.com", password: "@123abc!", username: "bob"
      expect(subject).to have_content("Welcome! You have signed up successfully.")
    end
  end

  context "with invalid input" do
    scenario "notifies user if the email is absent" do
      signup_with email: nil, password: "@123abc!"
      expect(subject).to have_content("Email can't be blank")
    end

    scenario "notifies user if the email has been used already" do
      signup_with email: old_user.email, password: "@123abc!"
      expect(subject).to have_content("Email has already been taken")
    end

    scenario "notifies user if the password is absent" do
      signup_with email: "what@hey.com", password: nil
      expect(subject).to have_content("Password can't be blank")
    end

    scenario "notifies user if the password confirmation doesn't match" do
      signup_with email: "what@bar.com", password: "@123abc!", confirm: "12341234"
      expect(subject).to have_content("Password confirmation doesn't match")
    end

    scenario "notifies user if username is absent" do
      signup_with email: "heybob@foobar.com", password: "@123abc!", username: nil
      expect(subject).to have_content("Username can't be blank")
    end
  end
end
