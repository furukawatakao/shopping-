class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  def new
  @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to 'root_url', notice: "ユーザー「#{user.name}」を登録しました"
  end

  def edit
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :image)
  end
end
