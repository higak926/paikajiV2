class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    "/user/#{current_user.id}"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :introduction])
  end

  def authenticate_admin_user!
    unless current_user.try(:admin?)
      flash[:danger] = "管理者用ページです。権限があるアカウントでログインしてください!"
      redirect_to root_path
    end
  end
end
