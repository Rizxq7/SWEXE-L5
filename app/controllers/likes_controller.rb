class LikesController < ApplicationController
  def create
    user = User.find_by(uid: session[:login_uid])

    unless user
      redirect_to root_path
      return
    end

    tweet = Tweet.find(params[:tweet_id])

    unless user.likes.exists?(tweet_id: tweet.id)
      user.like_tweets << tweet
    end

    redirect_to root_path
  end

  def destroy
    user = User.find_by(uid: session[:login_uid])

    unless user
      redirect_to root_path
      return
    end

    like = user.likes.find_by(id: params[:id])
    like&.destroy

    redirect_to root_path
  end
end