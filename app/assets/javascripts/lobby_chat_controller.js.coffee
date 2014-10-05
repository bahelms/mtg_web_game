ready = ->
  if $("@lobby_chat").length > 0
    new LobbyChatController()

jQuery -> ready()
$(document).on("page:load", ready)

class LobbyChatController
  constructor: ->
    @$lobbyChatBox = $("@lobby_chat_box")
    @$lobbyUsers = $("@lobby_users")
    @$lobbyChatInput = $("@lobby_chat_input")
    @$submitButton = $("@chat_submit")
    @dispatcher = new WebSocketRails("localhost:3000/websocket")
    @onConnection()
    @bindEvents()
    @setupTriggers()

  onConnection: ->
    @dispatcher.on_open = =>
      @$lobbyChatBox.append("Welcome to Lobby Chat")

  bindEvents: ->
    @currentUsersList()
    @addNewMessage()

  setupTriggers: ->
    @$submitButton.click =>
      @dispatcher.trigger "new_message", message: @$lobbyChatInput.val()

  addNewMessage: ->
    @dispatcher.bind "add_new_message", (response) =>
      @$lobbyChatBox.append("\n#{response.message}")

  currentUsersList: ->
    @dispatcher.bind "current_users_list", (response) =>
      @$lobbyUsers.val(response.users_list)

