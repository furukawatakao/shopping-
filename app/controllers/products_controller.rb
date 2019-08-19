class ProductsController < ApplicationController

  def index
    @search_form = Forms::ProductSearchForm.new
    @products = Product.all
  end

  def search
    @search_form = Forms::ProductSearchForm.new(search_params)
    @products = @search_form.search
    render :index
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def search_params
    params.require(:forms_product_search_form).permit(:name, :price_from, :price_to)
  end

end
