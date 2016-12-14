class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit(:nickname)
        end

        devise_parameter_sanitizer.permit(:account_update) do |user_params|
            user_params.permit(:nickname,:current_password,:email)
        end
    end

    def after_sign_out_path_for(resource)
      "/users/sign_in"
    end

end
