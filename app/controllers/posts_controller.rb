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
    @users = User.not_friends(current_user).take(10)
  
    @post = Post.new
    @posts = Post.all

    @comment = Comment.new
    @comments = Comment.all
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
