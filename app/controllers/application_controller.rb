class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_path, alert: "管理者権限がないのでアクセスできません" }
    end
  end

  private
  def group_member_check
    unless @group.members.include?(current_user)
      redirect_to user_path(current_user.id), notice:"そのグループに所属していないので見られません"
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :specification, :birthday, :icon])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :specification, :birthday, :icon])
  end
end
