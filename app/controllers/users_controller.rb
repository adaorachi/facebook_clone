class UsersController < ApplicationController
  def index
    @users = User.not_friends(current_user)
    @active_friendship = current_user.active_friendships.build
  end

  def show
    @user = User.find(params[:id])
    @active_friendship = current_user.active_friendships.build
    @posts = Post.posts(@user)
  end
end
