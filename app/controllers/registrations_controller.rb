class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:full_name, :username, :email, :password, :street_address, :city, :state, :zip_code, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:full_name, :username, :email, :password, :current_password, :street_address, :city, :state, :zip_code, :password_confirmation)
  end
end
