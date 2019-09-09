class MypageController < ApplicationController
  before_action :login_required

  def show
    @purchase_historys = Order.where(user_id: current_user.id)
  end
end
