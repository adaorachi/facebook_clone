module UsersHelper
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.firstname, class: 'gravatar')
  end

  def username(user)
    user.email.split('@')[0].capitalize
  end

  def name(user)
    "#{user.firstname} #{user.surname}"
  end

  def all_user_non_friend
    is_postive = @users.count.positive?
    count = @users.count
    [is_postive, count]
  end

  def user_friend(user)
    is_positive = user.friends.count.positive?
    count = user.friends.count
    [is_positive, count]
  end
  
end
