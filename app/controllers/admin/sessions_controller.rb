class Admin::SessionsController < Admin::ApplicationController

  skip_before_action :login_required

  def new
  end

  def create
    user = AdminUser.find_by(email: session_params[:email])

    if user&.authenticate(session_params[:password])
      session[:admin_user_id] = user.id
      redirect_to admin_products_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    session.delete(:admin_user_id)
    redirect_to admin_login_path, notice: 'ログアウトしました。'
  end

  def index

  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
