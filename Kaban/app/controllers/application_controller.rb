class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/422.html'
    end


    def re_redirect_to(location, status = 303)
      response.location = location
      response.status = status
    end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :role)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :role)}
  end




end
