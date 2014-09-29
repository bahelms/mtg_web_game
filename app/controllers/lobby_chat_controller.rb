class LobbyChatController < WebsocketRails::BaseController
  def client_connected
    broadcast_message :client_connected, { message: "You connected!" }
  end
end
