class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
#  before_action :set_user, only: [:show]

  def show
    # if current_user == @user
     @user = current_user
      @groups = current_user.groups
    #else
     # redirect_to user_path(current_user.id), notice: '他の人のマイページは見られません！'
    #end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
