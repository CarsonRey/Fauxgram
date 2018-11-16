class SessionsController < ApplicationController

  def new
  end


  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_index_path
    else
      redirect_to new_session_path
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to '/users/index'
  end

end
