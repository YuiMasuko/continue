class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_user, only: [:show]

  def show
    @groups = current_user.groups
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
