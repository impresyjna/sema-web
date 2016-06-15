class Api::V1::CategoriesController < ApplicationController
  respond_to :json

  def index
    categories = Category.all
    render json: categories, status: 200
  end

end
