module PostsHelper
  def liked_post_user(post)
    liked = ''
    if post.liked_by_users.count == 1
     liked = post.liked_by_users.include?(current_user) ? 'You' :  post.liked_by_users.first.name
    elsif post.liked_by_users.count > 1
      liked = post.liked_by_users.include?(current_user) ? 'You' : "#{post.liked_by_users.first.name}"
      liked += " and #{pluralize(post.liked_by_users.count - 1, 'other')}"
    end
    liked
  end

  def user_posts
    all_posts = @posts.count.positive?
    current_user_posts = current_user.posts.count.positive?
    [all_posts, current_user_posts]
  end

  def user_post(post_id)
    current_user.posts.find_by(id: post_id)
  end
end
