class ApplicationController < ActionController::Base
  helper_method :current_end_user

  #before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_end_user
    current_user if current_user.is_a?(User)
  end

  def after_sign_in_path_for(resource)
   user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
