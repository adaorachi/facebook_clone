class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render '/posts'
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
