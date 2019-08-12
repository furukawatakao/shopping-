class Admin::ManagementUsersController < ApplicationController
  def index
    @users= AdminUser.all
  end

  def new
    @adminuser = AdminUser.new
  end

  def create
    user = AdminUser.new(user_params)
    user.save
    redirect_to admin_management_users_url, notice: "管理ユーザー 「#{user.name}」を登録しました。"
  end

  def edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:management_user).permit(:name, :description, :image)
  end

end
