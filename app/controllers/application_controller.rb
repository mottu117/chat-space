class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:nickname, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:nickname, :email, :password, :current_password, :password_confirmation)
    end
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  # application_controller.rbに集約したメソッドには、appfuncを冠するものとする。
  # どこに記載されている処理なのかわかりにくくなるので。
  def appfunc_get_current_user_groups
    Group.includes(:groups_users).where(groups_users: { user_id: current_user.id })
  end
end
