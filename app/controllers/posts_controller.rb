class PostsController < ApplicationController
  # before_action :group_member_check
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.where(group_id: params[:group_id])
    @group_id = @posts.first.group_id
  end

  def show
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def edit
    @group = Group.find(params[:group_id])
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

  def post_params
    params.fetch(:post, {}).permit(:event_on, :content, :image)
  end
end
