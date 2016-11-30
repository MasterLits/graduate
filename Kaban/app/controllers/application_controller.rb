class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/422.html'
    end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :role)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :role)}
  end


end
