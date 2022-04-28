class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @tweet = Tweet.find_by(id: params[:comment][:tweet_id])
    if @tweet.present?
      if @comment.save
        flash[:notice] = "Tweet was created successfully."
      end
    end 
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    return unless current_user.id == @comment.user_id
    @comment.destroy if @comment.present?
    flash[:success] = 'Comment deleted'
    redirect_to tweets_path
  end
  
  private

  def comment_params
    params.require(:comment).permit(:description, :tweet_id)
  end

end
