class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    signup_password = BCrypt::Password.create(params[:user][:pass])
    user = User.new(uid: params[:user][:uid], pass: signup_password)
    if user.save
      redirect_to users_path, notice: "ユーザーが作成されました。"
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: "ユーザーが削除されました。"
  end
end
