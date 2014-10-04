class LobbyChatController < WebsocketRails::BaseController
  def client_connected
    send_message :connection_success, message: "Welcome to Lobby Chat!"
  end
end
