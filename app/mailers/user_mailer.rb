class UserMailer < ApplicationMailer
  default from: "noreply@recipebook.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Recipebook")
  end
end
