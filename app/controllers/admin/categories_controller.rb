class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def show
    @products = Category.find(params[:id]).products
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:message] = "Category created successfully"
      redirect_to admin_categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:message] = "Category updated successfully"
      redirect_to admin_categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:message] = "Category deleted successfully"
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :description, :image)
  end
end
