class MypageController < ApplicationController
  before_action :login_required

  def show
    @purchase_historys = OrderItem.where(user_id: current_user.id)
  end
end
