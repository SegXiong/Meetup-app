class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create, :destroy]
  before_action :find_post

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment successed"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment failed"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:alert] = "Delele successed"
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
