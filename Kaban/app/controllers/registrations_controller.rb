class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
     edit_user_path(current_user)
  end
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    profile_path
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :tel, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :tel, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
