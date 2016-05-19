class SessionsController < FrontController
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]

    user = user_email.present? && User.find_by(email: user_email)
    if user.present? and user.valid_password? user_password
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Niepoprawne dane'
      redirect_to root_path
    end
  end

  def destroy
  end
end
