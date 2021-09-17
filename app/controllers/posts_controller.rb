class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ index show new edit destroy]
  before_action :group_member_check, only: %i[ index show new edit destroy]

  def index
    @posts = Post.where(group_id: @group.id)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
    if current_user != @post.user
      redirect_to group_posts_path(@group), notice: '自分投稿のみ編集できます！'
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.group = Group.find(params[:group_id])
    if @post.save
      redirect_to group_path(@post.group.id), notice: '日常を投稿しました！'
    else
      flash.now[:error] = '投稿できませんでした'
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to group_posts_path(@post.group.id), notice: '日常を編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to group_path(@post.group.id), notice: '投稿を削除しました！'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:post).permit(:event_on, :content, :image, :post_id, :group_id)
  end
end
