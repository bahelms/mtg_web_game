class LobbyChatController < WebsocketRails::BaseController
  # def client_connected
  #   broadcast_message :client_connected, { message: "You connected!" }
  # end

  def test_event
    send_message :event_to_test, { message: "It worked" }
  end
end
