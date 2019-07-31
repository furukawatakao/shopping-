class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    product = Product.new(product_params)
    product.save!
    redirect_to "admin_products_path", notice: "商品#{product.name}を登録しました。"
  end

  def edit
  end

  private
  def product_params
    params.require(:product).permit(:name, :description)
  end

end
