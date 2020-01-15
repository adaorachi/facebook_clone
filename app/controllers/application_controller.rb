class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :surname, :birthdate, :gender])
  end

  def after_sign_in_path_for(_resource)
    # user_path(current_user)
    posts_path
  end
end
