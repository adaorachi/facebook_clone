class LikePostsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.like(post)

    redirect_to(request.referer)
  end

  def destroy
    post = LikePost.find(params[:id]).post
    current_user.unlike(post)
    
    redirect_to(request.referer)
  end
end
