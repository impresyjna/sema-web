class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Dodano kategorię"
      redirect_to categories_path
    else
      flash[:warning] = "Nie udało się dodać kategorii"
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Zaktualizowano"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
