class TweetsController < ApplicationController
  def create
    user = User.find_by(uid: session[:login_uid])

    unless user
      redirect_to root_path
      return
    end

    tweet = user.tweets.build(message: params[:message])

    if tweet.save
      redirect_to root_path, notice: 'ツイートしました'
    else
      redirect_to root_path, alert: 'ツイートを入力してください'
    end
  end
end