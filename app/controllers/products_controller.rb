class ProductsController < ApplicationController
  def index
    #search
  end

  def show
    @product = Product.find(params[:id])
  end
end
