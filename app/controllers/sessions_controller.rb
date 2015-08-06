class SessionsController < ApplicationController
 
  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && params[:password].present && user.authenticate(params[:password])
      sessions[:user_id] = user.id 
      redirect_to welcome_path, notice: "You have successfully signed in."
    else
      flash[:error] = "There was a problem with your login.  Please try again."
      redirect_to login_url
    end
  end
end
