class SessionsController < ApplicationController
  include SessionsHelper

  def direct
    if signed_in?
      redirect_to root_path
    else
      redirect_to home_path
    end
  end

  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && params[:password].present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "You have been logged in."
    else
      redirect_to login_url, alert: "Your username or password are incorrect. Please try again."
      
    end
  end

  # def twitter
  #   # raise request.env["omniauth.auth"].to_yaml
  #   auth = request.env["omniauth.auth"]
    
  #   if signed_in? && @current_user.uid.nil?
  #     @current_user.uid = auth.uid  
  #     @current_user.name = auth.info.nickname
  #     @current_user.save
  #     flash[:notice] = "You have successfully added your Twitter account."
  #     redirect_back_or root_url
  #   elsif signed_in?
  #     # if the user already has a Twitter account setup and wants to replace/update it:
  #     @current_user.uid = auth.uid  
  #     @current_user.name = auth.info.nickname
  #     @current_user.save
  #     flash[:notice] = "You have successfully updated your Twitter account info."
  #     redirect_back_or root_url
  #   else
  #     user = User.where(uid: auth["uid"]).first || User.from_twitter(auth)
  #     session[:user_id] = user.id
  #     flash[:notice] = "You have been logged in through Twitter."
  #     redirect_back_or root_url
  #   end
  # end

  def failure
    flash[:alert] = "Authentication Failed"
    redirect_back_or root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have been logged out."
  end
end
