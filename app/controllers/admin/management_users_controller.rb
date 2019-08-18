class Admin::ManagementUsersController < Admin::ApplicationController
  def index
    @adminusers= AdminUser.all
  end

  def new
    @adminuser = AdminUser.new
  end

  def show
    @adminuser = AdminUser.find(params[:id])
  end

  def create
    user = AdminUser.new(user_params)
    user.save!
    redirect_to admin_management_users_url, notice: "管理ユーザー 「#{user.name}」を登録しました。"
  end

  def edit
    @adminuser = AdminUser.find(params[:id])
  end

  def destroy
    @adminuser = AdminUser.find(params[:id])
    @adminuser.destroy
    redirect_to admin_management_users_url, notice: "管理ユーザー「#{@adminuser.name}」を削除しました。"
  end

  def update
    @adminuser = AdminUser.find(params[:id])

    if @adminuser.update(user_params)
      redirect_to admin_management_user_url(@adminuser), notice: "ユーザー「#{@adminuser.name}を更新しました。」"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:management_user).permit(:name, :email, :price, :password, :password_confirmation )
  end

end
