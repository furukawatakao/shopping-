class Admin::SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = AdminUser.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to admin_products_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def index

  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
