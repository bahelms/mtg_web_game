jQuery ->
  if $("@lobby_chat").length > 0
    new LobbyChatController()

class LobbyChatController
  constructor: ->
    @dispatcher = new WebSocketRails("localhost:3000/websocket")
    @listen()
    @dispatcher.trigger("test_event")

  listen: ->
    # @dispatcher.bind "client_connected", (data) ->
    #   console.log "Client connected"
    #   console.log data
    @dispatcher.bind "event_to_test", (data) ->
      console.log data

