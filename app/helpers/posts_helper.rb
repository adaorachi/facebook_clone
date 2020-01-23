module PostsHelper
  def liked_post_user(post)
    if post.liked_by_users.count == 1
      post.liked_by_users.include?(current_user) ? 'You' :  post.liked_by_users.first.name
    elsif post.liked_by_users.count > 1
      post.liked_by_users.include?(current_user) ? 'You' : "#{post.liked_by_users.first.name} and #{pluralize(post.liked_by_users.count - 1, 'other')}"
    end
  end
end
