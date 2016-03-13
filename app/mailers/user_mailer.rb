class UserMailer < ApplicationMailer
  default from: "mail@motorcyclephilanthropy.org"

  def welcome_email(user)
    @user = user
    @link = 'https://pack-tracker.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to Pack Tracker!')
  end
end
