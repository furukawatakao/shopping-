class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path, notice: "商品#{product.name}を登録しました。"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update!
    redirect_to admin_products_url, notice: "商品「#{product.name}を更新しました"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description)
  end

end
