class UserMailer < ApplicationMailer
  default from: "me@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://google.com'
    mail(to: @user.email, subject: 'test welcome email')
end