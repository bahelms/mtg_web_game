jQuery ->
  if $("@lobby_chat").length > 0
    new LobbyChatController()

class LobbyChatController
  constructor: ->
    @$lobbyChatBox = $("@lobby_chat_box")
    @dispatcher = new WebSocketRails("localhost:3000/websocket")
    @bindEvents()
    @setupTriggers()

  bindEvents: ->
    @connectionSuccess(@)

  setupTriggers: ->

  connectionSuccess: (self) ->
    @dispatcher.bind "connection_success", (response) ->
      self.$lobbyChatBox.append(response.message)

