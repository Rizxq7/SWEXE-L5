
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      uid: params[:uid],
      age: params[:age],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      redirect_to root_path, notice: 'ユーザー登録しました'
    else
      flash.now[:alert] = '登録に失敗しました。パスワードが一致しているか確認してください。'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy!
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end
end

