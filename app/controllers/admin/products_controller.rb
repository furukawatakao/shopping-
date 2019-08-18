class Admin::ProductsController < Admin::ApplicationController

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
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "商品#{@product.name}を登録しました。"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    product.update!(product_params)
    # product_attributes = product_params
    redirect_to admin_products_url, notice: "商品「#{product.name}を更新しました"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_products_path, notice: "商品「#{product.name}を削除しました」"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :image, :price)
  end

end
