class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin?, except: [:index, :show]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = @category.products
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :image)
  end
end