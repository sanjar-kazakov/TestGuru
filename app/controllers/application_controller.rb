class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Hi, #{current_user.first_name}!"
    resource.is_a?(Admin) ? admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[ first_name last_name ])
  end

end
