class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
    @cart_items = current_cart.cart_items
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(product_id: params[:product_id],user_id: current_user.id)
    end

    @cart_item.quantity = 0 if @cart_item.quantity.blank?
    @cart_item.quantity += 1
    @cart_item.save!
    redirect_to current_cart
  end

  def update_item
    @cart = Cart.find(params[:id])
    @cart.attributes = cart_params
    @cart.save!
    redirect_to cart_url, notice: "商品「#{@cart.name}」を更新しました"
  end

  def delete_item
    if @cart_item.quantity == 1
      @cart_item.destroy
    else
      @cart_item.quantity -= 1
      @cart_item.save
    end
      redirect_to current_cart
  end

  def purchase
    @cart = Cart.find(params[:id])
    @order = Order.create(user_id: @cart.user_id)
    @cart_items = CartItem.where(cart_id: params[:id])
    @cart_items.each do |item|
      @order_item = @order.order_items.build(
        user_id: current_user.id,
        quantity: item.quantity,
        product_id: item.product_id,
        sum_amount: item.quantity * item.product.price
      ).save!
    end
    session.delete(:cart_id)
    redirect_to products_path, notice: "商品購入しました"
  end

  private

   def setup_cart_item!
     @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
   end

   def cart_params
     params.require(:cart).permit(:id, :user_id, :quantity, :product_id, :sum_amount)
   end


end
