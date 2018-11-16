class UsersController < ApplicationController

  before_action :set_user, only: [:show,:edit, :update, :destroy, :followers, :followees]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :username, :password, :password_confirmation))
    @user.set_img_url
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def check_user
    @user = User.find_by(username: params[:user][:username])
    if  @user
      if (params[:user][:password] == @user.password)
          redirect_to @user
      end
    else
      render :login
    end
  end

  def show
    if current_user
      @current_user_does_not_follow = !current_user_follows?
      @current_user_follows = current_user_follows?
      @authorization =  authorization?
    else
      render :index
    end
  end

  def edit

  end

  def update
    if @user.update(user_params(:name, :password, :bio, :email, :number, :gender, :img_url))
      redirect_to @user
    else
      render :edit
    end
  end

  def login
    @user = User.new

  end


  def index
    @current_user = current_user
    if @current_user
      @followees = current_user.followees
      @pic = []
      @followees.each do |followee|
        @pic << followee.pictures
      end
      @pic.flatten!
      @pic.sort_by! {|pic| pic.created_at}
    end
  end

  def destroy
    @user.destroy
  end

  def followers
  end

  def followees
  end


  def redirect
      redirect_to session[:previous_url]
  end

  def discover
    @users = User.all
    # @users = User.all.select do |user|
    #   user.id != find_current_user.id
    # end
  end

# http://localhost:3000/users/1/pictures/1
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end




end
