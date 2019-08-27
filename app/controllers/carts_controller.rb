class CartsController < ApplicationController
  before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

  def show
     @cart_items = current_cart.cart_items
  end

  def add_item
  end

  def update_item
  end

  def delete_item
  end
end
