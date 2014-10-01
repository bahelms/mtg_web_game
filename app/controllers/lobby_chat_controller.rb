class LobbyChatController < WebsocketRails::BaseController
  def client_connected
    Rails.logger.info "Made it to #client_connected"
    send_message :connection_success, message: "Hello from chatcontroller"
  end

  def test_event
    Rails.logger.info "Made it to #test_event"
    send_message :event_to_test, message: "It worked"
  end
end
