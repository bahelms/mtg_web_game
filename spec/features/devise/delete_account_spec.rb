require "rails_helper"
require "support/authentication"

feature "Deleting your account" do
  let(:user) { create(:user) }
  subject { page }

  background do
    sign_in_with email: user.email, password: user.password
    click_link "Edit Account"
  end
end
