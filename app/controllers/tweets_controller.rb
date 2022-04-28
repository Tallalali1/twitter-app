class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def show
    @comment = Comment.new
  end

  def index
    @tweets = Tweet.all
    @comment = Comment.new
  end

  def new
    @tweet = Tweet.new
  end

  def edit

  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      flash[:notice] = "Tweet was created successfully."
      redirect_to @tweet
    else
      render 'new'
    end
  end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = "Tweet was updated successfully."
      redirect_to @tweet
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

 private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def tweet_params
    params.require(:tweet).permit(:title, :description)
  end

end
