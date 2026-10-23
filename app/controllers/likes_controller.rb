
class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])

    if current_user && !tweet.liked?(current_user)
      tweet.like(current_user)
    end

    redirect_to root_path
  end

  def destroy
    like = Like.find_by(id: params[:id])

    if current_user && like && like.user_id == current_user.id
      like.tweet.unlike(current_user)
    end

    redirect_to root_path
  end
end
