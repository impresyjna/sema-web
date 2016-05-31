class SessionsController < FrontController
  def create
    user_password = params[:session][:password]
    user_login = params[:session][:login]

    user = user_login.present? && User.find_by(login: user_login)
    if user.present? and user.valid_password? user_password
      log_in user
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Niepoprawne dane'
      redirect_to root_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
