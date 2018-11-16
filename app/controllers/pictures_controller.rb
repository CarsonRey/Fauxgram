class PicturesController < ApplicationController
  before_action :set_picture, only:[:edit, :update, :destroy, :show]

  def new
    @picture = Picture.new
    @user = User.find(params[:user_id])
  end

  def create
#picturecaptionshtml
    @user = User.find(params[:user_id])
    # byebug
    @picture = Picture.new(description: params[:picture][:description], img_url: params[:picture][:img_url], user_id: params[:user_id])

    if @picture.save
      hashtag_check(@picture.description)
      @content_hashtags.each do |element|
        @hashtag = Hashtag.find_or_create_by(hashtag: element)
        PictureHashtag.create(hashtag_id: @hashtag.id, picture_id: @picture.id)
      end
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user_can_edit_picture = authorized_on_picture
    @comment = Comment.new
    @like = Like.new
  end

  def edit
  end

  def update
   if @picture.update(picture_params(:description))
     hashtag_check(@picture.description)
     @content_hashtags.each do |element|
       @hashtag = Hashtag.find_or_create_by(hashtag: element)
       PictureHashtag.create(hashtag_id: @hashtag.id, picture_id: @picture.id)
     end
     redirect_to "/users/#{@user.id}/pictures/#{@picture.id}"
   else
     render :edit
   end
  end

  def destroy
    @picture.destroy
    redirect_to @user
  end

  private

  def picture_params(*args)
    params.require(:picture).permit(*args)
  end

  def set_picture
    @user = User.find(params[:user_id])
    @picture = Picture.find(params[:id])

  end


end
