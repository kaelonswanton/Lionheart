class ProductsController < ApplicationController
  def index
    @products = @q.result(distinct: true)
  end
end
