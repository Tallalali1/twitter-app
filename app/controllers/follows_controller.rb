class FollowsController < ApplicationController
  before_action :get_follow, only: [:destroy]
  
  def create
    if !already_followed?
      if user_params.to_i != current_user.id
        Follow.create(follower_id: current_user.id, followed_user_id: user_params)
      else
       flash[:alert] = "Can not follow self."
      end
    end
  end

  def destroy
    @follow.destroy if already_followed?
  end

  private
  def already_followed?
    Follow.find_by(follower_id: current_user.id ,followed_user_id: params[:id]).present?
  end

  def get_follow
    @follow = Follow.find_by(follower_id: current_user.id ,followed_user_id: params[:id])
  end

  def user_params 
    params.require(:user_id)
  end

end
