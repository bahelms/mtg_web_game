class MessageDecorator
  attr_reader :message, :user

  def initialize(message, user)
    @message = message
    @user = user
  end

  def empty?
    message.blank?
  end

  def format
    "#{timestamp} #{user.username}: #{message}"
  end

  private
    def timestamp
      Time.current.strftime("[%I:%M %P]")
    end
end

