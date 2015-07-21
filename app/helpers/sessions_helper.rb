module SessionsHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !current_user.nil?
  end

  def authentication_required
    unless signed_in?
      store_location
      # Not sure if we want/need the notice text at the top each time someone sees the login page
      # redirect_to login_url, notice: "Please sign in"
      redirect_to login_url
    end
  end

  def redirect_back_or(default, msg={})
    redirect_to((session[:return_to] || default), msg)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
