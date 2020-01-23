module FriendshipsHelper
  def active_friendship(friend_id)
    current_user.active_friendships.find_by(active_friend_id: friend_id)
  end

  def passive_friendship(user_id)
    current_user.passive_friendships.find_by(passive_friend_id: user_id)
  end

  def incoming_requests
    is_positive = current_user.pending_requests_from_users.count.positive?
    count = current_user.pending_requests_from_users.count
    [is_positive, count]
  end

  def outgoing_requests
    is_positive = current_user.pending_requests_to_users.count.positive?
    count = current_user.pending_requests_to_users.count
    [is_positive, count]
  end
end
