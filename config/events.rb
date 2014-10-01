WebsocketRails::EventMap.describe do
  subscribe :client_connected, "lobby_chat#client_connected"
  subscribe :test_event, "lobby_chat#test_event"

  # You can use this file to map incoming events to controller actions.
  # One event can be mapped to any number of controller actions. The
  # actions will be executed in the order they were subscribed.
end
