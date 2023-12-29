class Admin::ProductsController < Admin::BaseController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:message] = "Product created successfully!"
      redirect_to admin_category_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image, category_ids: [])
  end
end
