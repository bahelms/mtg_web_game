require "rails_helper"
require "websocket_rails/spec_helpers"

describe "LobbyChatController" do
  describe "client_connected" do
    it "routes to lobby_chat#client_connected" do
      expect(create_event("client_connected", nil)).
        to be_routed_only_to "lobby_chat#client_connected"
    end

    it "triggers a success message" do
      # expect(create_event("client_connected", nil).dispatch).
      #   to trigger_message
      pending "trigger_message doesn't check for broadcast or send"
      fail
    end
  end

  describe "client_disconnected" do
    it "routes to lobby_chat#client_disconnected" do
      expect(create_event("client_disconnected", nil)).
        to be_routed_only_to "lobby_chat#client_disconnected"
    end
  end

  describe "new_message" do
    it "routes to lobby_chat#new_message" do
      expect(create_event("new_message", message: "New Message")).
        to be_routed_only_to "lobby_chat#new_message"
    end
  end
end
