class SessionsController < ApplicationController
  include SessionsHelper 
  
  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && params[:password].present? && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to welcome_path, notice: "You have successfully signed in.  Your username is #{user.email}."
    else
      flash[:error] = "There was a problem with your login for #{params[:email]}.  Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path, notice: 'You have been logged out'
  end

  def twitter
    auth = request.env["omniauth.auth"]
    if current_user
      current_user.update_attribute(:uid, auth["uid"])
      flash[:notice] = 'Success!  Twitter account linked.'
      redirect_to welcome_path
    elsif 
      user = User.where(uid: auth['uid']).first || User.from_twitter(auth)
      if user
        session[:user_id] = user.id
        flash[:notice] = "Success!  You have been logged in through Twitter as #{user.name}."
        redirect_back_or root_url
      end
    end
  end

  def failure
    flash[:error] = "Oops!  Something went wrong with your authentication"
    redirect_back_or root_url
  end
end
