jQuery ->
  if $("@lobby_chat").length > 0
    new LobbyChatController()

class LobbyChatController
  constructor: ->
    @initialize()
    @bindEvents()
    @setupTriggers()

  initialize: ->
    @$lobbyChatBox = $("@lobby_chat_box")
    @$lobbyUsers = $("@lobby_users")
    @$lobbyChatInput = $("@lobby_chat_input")
    @$submitButton = $("@chat_submit")
    @dispatcher = new WebSocketRails("localhost:3000/websocket")
    @dispatcher.on_open = =>
      @$lobbyChatBox.append("Welcome to Lobby Chat")

  bindEvents: ->
    @currentUsersList()
    @addNewMessage()

  setupTriggers: ->
    @clickSendButton()
    @pressEnterToSend()

  ## Events ##

  addNewMessage: ->
    @dispatcher.bind "add_new_message", (response) =>
      if response.message != ""
        @$lobbyChatBox.append(response.message)

  currentUsersList: ->
    @dispatcher.bind "current_users_list", (response) =>
      @$lobbyUsers.append(response.users_list)

  ## Triggers ##

  clickSendButton: ->
    @$submitButton.click =>
      if @$lobbyChatInput.val() != ""
        @dispatcher.trigger "new_message", message: @$lobbyChatInput.val()
        @$lobbyChatInput.val("")

  pressEnterToSend: ->
    $(document).on "keypress", (event) =>
      if @$lobbyChatInput.is(":focus") and event.which == 13 and
      @$lobbyChatInput.val() != ""
        @dispatcher.trigger "new_message", message: @$lobbyChatInput.val()
        @$lobbyChatInput.val("")

