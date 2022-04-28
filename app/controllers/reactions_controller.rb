class ReactionsController < ApplicationController
   before_action :find_tweet, only: [:create :destroy]
   before_action :find_reaction, only: [:destroy]
  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @tweet.reactions.create(user_id: current_user.id)
    end
    redirect_to tweet_path(@tweet)
  end
  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @reaction.destroy
    end
    redirect_to tweet_path(@tweet)
  end

  private
  def find_tweet
    @tweet = Tweet.find_by(id: params[:tweet_id])
  end

  def already_liked?
    Reaction.where(user_id: current_user.id, tweet_id:
    params[:tweet_id]).exists?
  end

  def find_reaction
    @reaction = @tweet.reactions.find_by(id: params[:id])
  end
end
