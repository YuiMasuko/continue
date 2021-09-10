class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[ show edit update destroy invite]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.invite_member(current_user)
      redirect_to @group, notice: 'グループを作成しました！'
    else
      flash.now[:error] = 'グループを作成できませんでした'
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'グループ情報を編集しました！'
    else
      flash.now[:error] = 'グループ情報を編集できませんでした'
      render :new
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'グループを削除しました！'
  end

  def invite

  end

  private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.fetch(:group, {}).permit(:name, :image)
  end
end
