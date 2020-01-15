class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :access_actions, only: [:index, :create]

  def index
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:notice] = 'Write a post!'
      render :index
    end
  end

  private

  def access_actions
    @post = Post.new
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
