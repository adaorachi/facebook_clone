class FriendshipsController < ApplicationController
  def index
  end

  def create
    add_friend = User.find(params[:passive_friend_id])
    current_user.send_request(add_friend)
    flash[:notice] = "Your friend request to #{add_friend.name} was sent successfully!"
    redirect_to(request.referer)
  end

  def update
    friendship = Friendship.find(params[:id])
    friend_id = friendship.passive_friend_id
    friended_user = friendship.passive_friend.name

    if params[:accept_request]
      current_user.create_reciprocal_friendship(friend_id)
      flash[:notice] = "You are now friends with #{friended_user}"
    elsif params[:decline_request]
      friendship.destroy
      flash[:notice] = "Friend request from #{friended_user} has been declined"
    end
    redirect_to(request.referer)
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friend_id = friendship.active_friend_id
    friended_user = friendship.active_friend.name

    current_user.destroy_reciprocal_friendship(friendship, friend_id)
    flash[:notice] = "You have unfriended #{friended_user}"
    redirect_to(request.referer)
  end

  def redirect_request
  end

  def sent_request
  end

end
