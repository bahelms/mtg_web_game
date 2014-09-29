require "rails_helper"
require "websocket_rails/spec_helpers"

describe "LobbyChatController" do
  # describe "client_connected" do
  #   it "routes to lobby_chat#client_connected" do
  #     expect(create_event("client_connected", nil)).
  #       to be_routed_only_to "lobby_chat#client_connected"
  #   end

  #   it "triggers a success message" do
  #     expect(create_event("client_connected", nil).dispatch).
  #       to trigger_message
  #   end
  # end

  describe "test_event" do
    it "routes to lobby_chat#test_event" do
      expect(create_event("test_event", nil)).
        to be_routed_only_to "lobby_chat#test_event"
    end

    it "triggers a success message" do
      expect(create_event("test_event", nil).dispatch).
        to trigger_message
    end
  end
end
