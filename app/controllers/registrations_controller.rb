class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    email = "#{params[:user][:name].parameterize}@ruby.demo"
    password = 'password'
    params[:user][:email] = email
    params[:user][:password] = password
    params[:user][:password_confirmation] = password
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
  end
end
