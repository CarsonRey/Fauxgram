class FollowingsController < ApplicationController

  def new

  end

  def create
    @user = User.find(params[:user_id])
    current_user.followees << @user
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @following = Following.find_by(follower_id: current_user.id, followee_id: @user.id)
    @following.destroy
    redirect_to @user
  end

end
