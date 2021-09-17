class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :group_member_check

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :index
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if @comment.destroy
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :group_id, :user_id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
