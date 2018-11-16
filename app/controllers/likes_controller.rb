class LikesController < ApplicationController
  before_action :set_info, only: [:edit, :update, :destroy, :create]

  # def index
  #   redirect_to "/users/#{@user.id}/pictures/#{@picture.id}"
  # end

  def new
    @like = Like.new
  end
#gravita icons gem
  def create
    @like = Like.new(icon_id: params[:icon_id], user_id: current_user.id, picture_id: params[:picture_id])

    if @like.save
      redirect_to "/users/#{@user.id}/pictures/#{@picture.id}"
    else
      render :new
    end
  end



  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_info
    @user = User.find(params[:user_id])
    @picture = Picture.find(params[:picture_id])
  end
end
