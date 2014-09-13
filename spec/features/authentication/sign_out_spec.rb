require "rails_helper"
require "support/authentication"

feature "Signing out of a valid session" do
  let(:user) { create(:user) }
  subject { page }

  background do
    visit root_path
    sign_in_with email: user.email, password: user.password
    click_link "Sign Out"
  end

  it { should_not have_link "Sign Out" }
  it { should have_button "Sign In" }
end

