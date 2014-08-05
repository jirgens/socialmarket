class ProductsController < InheritedResources::Base
  actions :index, :show, :new, :edit, :update
  before_action :require_user, only: [:new]

  def create
    @product = Product.new(product_params)
    @product.seller = current_user
    if @product.save
      flash[:success] = "Your thing is listed!"
      redirect_to root_path
    else
      flash[:error] = "There's a problem with your thing."
      render :new
    end
  end

  def newest
    products.index.order('created_at DESC')
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :pic1, :pic2, :pic3, :pic4, :price)
  end

end
