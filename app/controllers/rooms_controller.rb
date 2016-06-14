class RoomsController < ApplicationController
  def index
    @rooms = Room.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @room = Room.find(params[:id])
    @users = @room.room_users
  end

  def new
    @room = Room.new
    @categories = Category.all.pluck(:name, :id)
  end

  def edit
    @room = Room.find(params[:id])
    @categories = Category.all.pluck(:name, :id)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Dodano pokój"
      redirect_to rooms_path
    else
      flash[:warning] = "Nie udało się dodać pokoju"
      render 'new'
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      flash[:success] = "Dane zaktualizowane"
      redirect_to rooms_path
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id]).destroy
    flash[:success] = "Usunięto pokój"
    redirect_to rooms_path
  end

  private

  def room_params
    params.require(:room).permit(:name, :category_id)
  end
end
