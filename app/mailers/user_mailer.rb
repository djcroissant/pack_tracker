class UserMailer < ApplicationMailer
  default from: "me@gmail.com"

  def welcome_email(user)
    @user = user
    @link = 'http://google.com'
    mail(to: @user.email, subject: 'Welcome to Pack Tracker!')
  end
end
