class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "商品#{@user.name}を登録しました。"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :description, :email, :password, :password_confirmation )
  end

end
