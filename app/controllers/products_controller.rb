class ProductsController < ApplicationController
  def index
    #search
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user && current_user.admin?
      @product.destroy
      flash[:message] = "Product deleted successfully"
      redirect_to categories_path
    else
      flash[:error] = "You are not authorized to delete this product"
      redirect_to categories_path
    end
  end
end
