class SessionsController < ApplicationController

  # Display login form
  def new
    @user = User.new
  end

  # Log user in
  def create
    @user = User.find(params[:user_name])
    if @user #&& @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  # Log user out
  def delete
    session.clear
    redirect_to root_path
  end

end