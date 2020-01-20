class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.not_friends(current_user)
  end

  def show
  end
end
