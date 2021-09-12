class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    #招待機能
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
    assign = Assign.find(params[:id])
    if Assign.where(group_id: assign.group.id).count == 1
      redirect_to group_path(assign.group.id), notice: 'メンバーがいなくなるため、退会する場合はグループを削除してください'
    else
      assign.destroy
      redirect_to user_path(current_user.id), notice: 'グループから退会しました'
    end
  end




end
