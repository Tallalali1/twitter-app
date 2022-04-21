class TweetsController < ApplicationController

  def show

  end

  def index
    @tweets = Tweet.all
    
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

  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

 private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
  
  def tweet_params
    params.require(:tweet).permit(:title, :description)
  end



end