require "rails_helper"
require "support/authentication"

feature "Visit profile" do
  let(:user) { create(:user, username: "Tiberius") }
  subject { page }

  background do
    sign_in user
    visit user_path(user)
  end

  it { should have_link("Edit Account") }
  it { should have_content("Tiberius") }
end
