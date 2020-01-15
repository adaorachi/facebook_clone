class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where('id != ?', current_user)
  end

  def show
  end
end
