class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @tweet = Tweet.find(params[:comment][:tweet_id])
    if @comment.save
      flash[:notice] = "Tweet was created successfully."
      # render :json => { :sent => true}
    end
    # redirect_to @tweet
  end

  def destroy
    @comment = Comment.find(params[:id])
    return unless current_user.id == @comment.user_id
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to tweets_path
  end
  
  private

  def comment_params
    params.require(:comment).permit(:description, :tweet_id)
  end

end
