class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    group = Group.find(params[:group_id])
    user = User.find_by(specification: params[:specification])
    if user && user.birthday.strftime('%Y-%m-%d') == params[:birthday]
      group.invite_member(user)
      redirect_to group_path(group), notice: '新メンバーを招待しました！'
    else
      redirect_to group_path(group), notice: 'ユーザーが見つかりませんでした'
    end

  end

  def destroy

  end




end
