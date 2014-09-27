def send_message(text)
  fill_in "lobby_chat_input", with: text
  click_button "Send"
end

