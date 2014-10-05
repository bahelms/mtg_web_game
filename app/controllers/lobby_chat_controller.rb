class LobbyChatController < WebsocketRails::BaseController
  def initialize_session
    controller_store[:lobby_users] = []
  end

  def client_connected
    controller_store[:lobby_users] << current_user
    broadcast_current_users
  end

  def client_disconnected
    controller_store[:lobby_users].delete(current_user)
    broadcast_current_users
  end

  def new_message
    decorator = MessageDecorator.new(message[:message], current_user)
    broadcast_message :add_new_message, message: decorator.format
  end

  private
    def users_list
      controller_store[:lobby_users].map(&:username).join("\n")
    end

    def broadcast_current_users
      broadcast_message :current_users_list, users_list: users_list
    end
end

