class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #UserMailer.welcome_email(@user).deliver_now
      redirect_to welcome_path, notice: "You signed up -- good for you!"
    else
      flash[:alert] = @user.errors.full_messages
      render "new"
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def get_alert
      @user.errors.full_messages.reduce('') {|er, acc| er + "\n" + acc}
    end
end
