class AssignsController < ApplicationController
  before_action :authenticate_user!

  def create
    group = Group.find(params[:group_id])
    user = User.find_by(assign_params)

  end

  def destroy

  end

  private
  def assign_params
    params[:specification, :birthday]
  end


end
