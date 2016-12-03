
class ApplicationController < ActionController::Base
  include  Errors::RescueError
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/422.html'
  end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :task_notifications

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :current_password, :role, :tel,
                                                              :passport, :first_name, :inn, :last_name)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :current_password,
                                                                     :role, :passport, :inn, :first_name, :last_name, :tel,)}
  end

  def task_notifications
    if user_signed_in?
      @task_notifications = current_user.task_notifications
    end
  end
end