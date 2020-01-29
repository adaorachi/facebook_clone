class UsersController < ApplicationController
  def index
    @users = User.not_friends(current_user)
    @active_friendship = current_user.active_friendships.build
  end

  def show
    @user = User.find(params[:id])
    @active_friendship = current_user.active_friendships.build
    @posts = @user.posts
  end

  def search
    @search_users = User.search_user(params[:q])
    # @search_users = User.all if @search_users.nil?
  end
end
