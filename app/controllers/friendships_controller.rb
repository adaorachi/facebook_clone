class FriendshipsController < ApplicationController
  def index
  end
  def create
    add_friend = User.find(params[:passive_friend_id])
    current_user.send_request(add_friend)
    redirect_to posts_path
  end

  def destroy
    remove_friend = Friendship.find(params[:id])
    remove_friend.destroy
    redirect_to posts_path
  end

  def update
    accept_friendship = Friendship.find(params[:id])
    if params[:accept_request]
      accept_friendship.confirmed = true
      if accept_friendship.save
        flash[:notice] = "You are now friends with #{accept_friendship.active_friend.name}"
        redirect_to '/received_request'
      end
    elsif params[:decline_request]
      accept_friendship.destroy
      flash[:notice] = "Request from #{accept_friendship.active_friend.name} has been declined"
      redirect_to '/received_request'
    end
  end

  def redirect_request
  end

  def sent_request
  end

end
