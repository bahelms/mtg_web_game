class UsersListPresenter
  attr_reader :users

  def initialize(users)
    @users = users
  end

  def format
    users.map(&:username).join
  end
end
