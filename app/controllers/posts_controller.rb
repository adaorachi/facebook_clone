class PostsController < ApplicationController
  before_action :access_actions, only: [:index, :create]

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to(request.referer)
    else
      flash.now[:notice] = 'Write a post!'
      render :index
    end
  end

  def update
    user_post = Post.find(params[:id])
    if user_post.update(post_params)
      redirect_to(request.referer)
    else
      render :index
    end
  end

  def destroy
    user_post = Post.find(params[:id])
    user_post.destroy
    flash[:notice] = 'Post deleted!'
    redirect_to(request.referer)
  end

  private

  def access_actions
    @users = User.not_friends(current_user).take(10)
  
    @post = Post.new
    @posts = Post.posts(current_user)

    @comment = Comment.new
    @active_friendship = current_user.active_friendships.build
  end

  def post_params
    params.require(:post).permit(:body, :user_id, post_image: [])
  end
end
