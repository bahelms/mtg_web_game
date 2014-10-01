jQuery ->
  if $("@lobby_chat").length > 0
    dispatcher = new WebSocketRails("localhost:3000/websocket")
    dispatcher.trigger("test_event", null)
    # new LobbyChatController()

class LobbyChatController
  constructor: ->
    @dispatcher = new WebSocketRails("localhost:3000/websocket")
    @dispatcher.on_open = (data) ->
      console.log "Connected!"

    @dispatcher.bind "connection_success", (data) ->
      console.log "Client connected"
      console.log data
    @dispatcher.bind "event_to_test", (data) ->
      console.log data
    @dispatcher.trigger("test_event", null)

