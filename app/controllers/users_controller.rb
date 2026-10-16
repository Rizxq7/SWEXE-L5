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
      age: params[:age]
    )
    @user.password = params[:pass]

    if @user.save
      redirect_to root_path, notice: 'ユーザー登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy!
    redirect_to users_path, notice: 'ユーザーを削除しました'
  end
end