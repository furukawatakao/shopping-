class ApplicationController < ActionController::Base
  helper_method :current_user

  protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
      return @cart
    else
      @cart = Cart.create(user_id: current_user.id)
      session[:cart_id] = @cart.id
      return @cart
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

    def login_required
      redirect_to login_url unless current_user
    end
end
