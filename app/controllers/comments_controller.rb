class CommentsController < ApplicationController
  before_action :set_info, only: [:edit, :update, :destroy, :create]


  def new
    @comment = Comment.new
  end
#gravita icons gem
  def create

    @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, picture_id: params[:picture_id])
    if @comment.save
      hashtag_check(@comment.content)
      find_or_create_by
      # redirect_to user_picture_path(@picture)
      redirect_to "/users/#{@user.id}/pictures/#{@picture.id}"
    else
      redirect_to "/users/#{@user.id}/pictures/#{@picture.id}"
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
