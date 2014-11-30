jQuery ->
  if $("@lobby_chat").length > 0
    new LobbyChatController()

class LobbyChatController
  constructor: ->
    @initialize()
    @bindEvents()
    @setupTriggers()

  initialize: ->
    @host = $("@websocket_host").data("websocket_host")
    @dispatcher = new WebSocketRails(@host)
    @$lobbyChatBox = $("@lobby_chat_box")
    @$lobbyUsers = $("@lobby_users")
    @$lobbyChatInput = $("@lobby_chat_input")
    @$submitButton = $("@chat_submit")
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
      @$lobbyChatBox.append(response.message)
      @$lobbyChatBox[0].scrollTop = @$lobbyChatBox[0].scrollHeight

  currentUsersList: ->
    @dispatcher.bind "current_users_list", (response) =>
      @$lobbyUsers.html(response.users_list)

  ## Triggers ##

  sendMessage: ->
    if @$lobbyChatInput.val() != ""
      @dispatcher.trigger "new_message", message: @$lobbyChatInput.val()
      @$lobbyChatInput.val("")

  clickSendButton: ->
    @$submitButton.click => @sendMessage()

  pressEnterToSend: ->
    $(document).on "keypress", (event) =>
      if @$lobbyChatInput.is(":focus") and event.which == 13
        @sendMessage()

