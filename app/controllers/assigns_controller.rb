class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    #招待機能
    group = Group.find(params[:group_id])
    user = User.find_by(specification: params[:specification])

    if group.members.exists?(user.id)
      redirect_to group_path(group), notice: '既にメンバーに招待済みです！'
    elsif user && user.birthday.strftime('%Y-%m-%d') == params[:birthday]
      group.invite_member(user)
      redirect_to group_path(group), notice: '新メンバーを招待しました！'
    else
      redirect_to group_path(group), notice: 'ユーザーが見つかりませんでした'
    end

  end

  def destroy
    assign = Assign.find(params[:id])
    if Assign.where(group_id: assign.group.id).count == 1
      redirect_to group_path(assign.group.id), notice: 'メンバーがいなくなるため、退会できません、、、！'
    else
      assign.destroy
      redirect_to user_path(current_user.id), notice: 'グループから退会しました'
    end
  end
end
