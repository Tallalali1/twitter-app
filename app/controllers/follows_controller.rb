class FollowsController < ApplicationController
  before_action :find_follow, only: [:destory]
  before_action :user_params, only: [:create]

  def create

    Follow.create(follower_id: current_user.id, followed_user_id: user_params)

    redirect_to root_path
  end
  def destroy
    @follow.destroy
    redirect_to users_path(@user)
  end

  private

  def find_follow
    @follow = @user.follows.find(params[:id])
  end

  def user_params 
    params.require(:user_id)
  end

end
