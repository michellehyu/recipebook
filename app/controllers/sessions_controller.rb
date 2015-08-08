class SessionsController < ApplicationController
 
  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && params[:password].present? && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to welcome_path, notice: "You have successfully signed in.  Your username is #{user.email}."
    else
      flash[:error] = "There was a problem with your login for #{params[:email]}.  Please try again."
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path, notice: 'You have been logged out'
  end
end
