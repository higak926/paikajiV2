class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    if current_user
      flash[:notice] = "ログインしましたよ" 
      root_url
    else
      flash[:notice] = "ログインに失敗しました" 
      root_url
    end
  end

  def after_sign_out_path_for(resource)
    flash[:alert] = "ログアウトしました"
    root_path
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
