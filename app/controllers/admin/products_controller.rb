class Admin::ProductsController < Admin::BaseController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:message] = "Product created successfully!"
      redirect_to categories_path
    else
      flash.now[:error] = @product.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end 
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:message] = "Product updated successfully!"
      redirect_to @product
    else
      flash.now[:error] = @product.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:message] = "Product deleted successfully"
    redirect_to categories_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :category_ids => [])
  end
end
