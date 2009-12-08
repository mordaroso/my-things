class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  filter_parameter_logging :password

  def logged_in?
    session[:login]
  end
  helper_method :logged_in?

  def logged_in_required
    redirect_to root_url unless logged_in?
  end
end
