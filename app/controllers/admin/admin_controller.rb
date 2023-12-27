class Admin::AdminController < ApplicationController
  def index
    @users = User.all
    @products = Product.all
    @categories = Category.all
    #@orders = Order.all
  end

end
