class UsersController < FrontController

  def index
    @users = User.paginate(:page => params[:page], :per_page => 30)
  end
end
