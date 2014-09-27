require "rails_helper"
require "support/authentication"
require "support/lobby_chat"

feature "Talking to users in the lobby chat room" do
  let(:user) { create(:user, username: "Xmus Waxon") }
  subject { page }
  background { sign_in user }

  it { should have_content("Lobby") }

  scenario "users in lobby have their usernames listed" do
    expect(subject).to have_selector("lobby_users", text: user.username)
  end

  scenario "typing text and pressing Send updates the chat text area" do
    text = "Hey there Sally Jones!"
    send_message text
    expect(subject).to have_selector("lobby_chat_box", text: text)
  end

  scenario "sending a message displays the sender's username" do
    send_message "This is the coolest chat room I've ever seen"
    expect(subject).to have_selector("lobby_chat_box", text: user.username)
  end

  scenario "sending a message displays the time at which it was sent" do
    pending "Not sure how to test the time stamp"
    fail
    # send_message "You darn tootin!"
    # expect(subject).to have_selector("lobby_chat_box", text: "Pending")
  end
end

