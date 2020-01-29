module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_url
  end

  def user_image(user, size)
    if user.image
      image_tag(user.image, alt: user.firstname, class: 'gravatar', width: size)
    else
      image_tag(gravatar_for(user), alt: user.firstname, class: 'gravatar', width: size)
      
    end
  end

  def user_gender(user)
    user.gender ? user.gender.capitalize : 'Unknown'
  end

  def user_birthdate(user)
    user.birthdate ? user.birthdate.strftime("%B %d") : 'Unknown'
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
  
  def mutual_friends(current_user, user_friend)
    arr_friend = ''
    mutual_f = current_user.friends && user_friend.friends
    mutual_friendship = mutual_f.map {|friend| friend if current_user.friend?(friend)}.compact
    if mutual_friendship.count == 1
      arr_friend = "<strong>#{mutual_friendship.first.name}</strong> is a mutual friend"
    elsif mutual_friendship.count > 1
      arr_friend = "<strong>#{mutual_friendship.first.name}</strong> and #{mutual_friendship.count - 1} other mutual "
      arr_friend += "friend".pluralize(mutual_friendship.count - 1)
    else
      arr_friend = 'No mutual friend'
    end
    arr_friend.html_safe
  end

  def search_info(search, searched_count)
    searched_info = ''
    if searched_count
      if searched_count.count.positive? 
        searched_info = "Search for \"#{search}\"<br> "
        searched_info += "Result for #{pluralize(searched_count.count, 'user')}"
      else
        searched_info = "No search for \"#{search}\""
      end
    else
      searched_info = "Search for something"
    end
    searched_info.html_safe
  end
end
