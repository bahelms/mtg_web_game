class LobbyChatController < WebsocketRails::BaseController
  def initialize_session
    controller_store[:lobby_users] = []
  end

  def client_connected
    controller_store[:lobby_users] << current_user
    broadcast_message :new_user_joined_chat, users_list: users_list
  end

  def new_message
    broadcast_message :add_new_message, message: message[:message]
  end

  private
    def users_list
      controller_store[:lobby_users].map(&:username).join("\n")
    end
end
