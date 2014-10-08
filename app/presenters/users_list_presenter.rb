class UsersListPresenter
  attr_reader :users

  def initialize(users)
    @users = users
  end

  def format
    users.map { |user| "<p>#{user.username}</p>" }.join
  end
end
