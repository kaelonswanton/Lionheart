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

  def destroy
    @category = Category.find(params[:id])
    if current_user && current_user.admin?
      @category.destroy
      flash[:message] = "Category deleted successfully"
      redirect_to categories_path
    else
      flash[:error] = "You are not authorized to delete this category"
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :image)
  end

  def admin?
    unless current_user.admin?
      redirect_to root_path, error: "You are not authorized to view this page"
    end
  end
end