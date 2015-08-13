module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def signed_in?
    !current_user.nil?
  end 

  def redirect_back_or(default, msg={})
    redirect_to((session[:return_to] || default), msg)
    session.delete(:return_to)
  end
end
