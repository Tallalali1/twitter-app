class ReactionsController < ApplicationController
   before_action :find_tweet
  def create
    @tweet.likes.create(user_id: current_user.id)
    redirect_to tweet_path(@tweet)
  end
  private
  def find_tweet
    @tweet = Tweet.find(params[:post_id])
  end
end