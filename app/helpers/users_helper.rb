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
end