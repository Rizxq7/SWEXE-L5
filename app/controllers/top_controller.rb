class TopController < ApplicationController
  def main
    @tweets = Tweet.includes(:user, :likes)
                   .order(created_at: :desc)
  end

  def login
    user = User.find_by(uid: params[:uid])

    if user && user.authenticate(params[:pass])
      session[:login_uid] = user.uid
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to root_path, alert: 'IDまたはパスワードが違います'
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end
end