jQuery ->
  if $("@lobby_chat").length > 0
    new LobbyChatController()

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
    @newUserJoinedChat()
    @addNewMessage()

  setupTriggers: ->
    @$submitButton.click =>
      @dispatcher.trigger "new_message", message: @$lobbyChatInput.val()

  addNewMessage: ->
    @dispatcher.bind "add_new_message", (response) =>
      @$lobbyChatBox.append("\n#{response.message}")

  newUserJoinedChat: ->
    @dispatcher.bind "new_user_joined_chat", (response) =>
      @$lobbyUsers.val(response.users_list)

