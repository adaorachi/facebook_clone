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

  private

  def access_actions
    @users = User.not_friends(current_user).take(10)
  
    @post = Post.new
    @posts = Post.posts(current_user)

    @comment = Comment.new
    @active_friendship = current_user.active_friendships.build
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
