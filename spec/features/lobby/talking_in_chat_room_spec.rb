require "rails_helper"
require "support/authentication"
require "support/lobby_chat"

feature "Talking to users in the lobby chat room" do
  given(:user) { create(:user, username: "Xmus Waxon") }
  subject { page }
  background { sign_in user }

  it { should have_content("Lobby") }

  scenario "users in lobby have their usernames listed" do
    # expect(subject).to have_selector("lobby_users", text: user.username)
    pending "can't test websockets/js"
    fail
  end

  scenario "typing text and pressing Send updates the chat text area" do
    # text = "Hey there Sally Jones!"
    # send_message text
    # expect(subject).to have_selector("#lobby_chat_box", text: text)
    pending "can't test websockets/js"
    fail
  end

  scenario "sending a message displays the sender's username" do
    # send_message "This is the coolest chat room I've ever seen"
    # expect(subject).to have_selector("lobby_chat_box", text: user.username)
    pending "can't test websockets/js"
    fail
  end

  scenario "sending a message displays the time at which it was sent" do
    # send_message "You darn tootin!"
    # timestamp = Time.current.strftime("[%H:%M]")
    # expect(subject).to have_selector("lobby_chat_box", text: timestamp)
    pending "can't test websockets/js"
    fail
  end

  scenario "sending an empty string message does nothing" do
    pending "not sure how to test"
    fail
  end
end

