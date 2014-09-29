require "rails_helper"
require "websocket_rails/spec_helpers"

describe "ChatController" do
  describe "client_connected" do
    it "is routed to chat#client_connected" do
      expect(create_event("client_connected", nil)).
        to be_routed_only_to "chat#client_connected"
    end

    it "triggers a success message" do
      expect(create_event("client_connected", nil).dispatch).
        to trigger_success_message
    end
  end
end
