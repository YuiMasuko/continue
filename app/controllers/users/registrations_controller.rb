class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  def after_sign_up_path_for(resource)
    user_path(id: current_user.id)
  end


  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  # def after_sign_out_path_for(resource)
  #   new_user_session_path
  #   redirect_to root_path, notice: 'ログアウトしました！'
  # end

end
